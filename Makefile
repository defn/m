ignore:
	@true

all:
	git ls-files | grep flake.nix | perl -pe 's{/?flake.nix}{}' | runmany 'mark $$1; cd ./$$1 && nix build'

bazel-ignore:
	echo tf > .bazelignore
	echo node_modules >> .bazelignore
	git ls-files | grep flake.nix | perl -pe 's{(/?)flake.nix}{\1.direnv}' | sort >> .bazelignore
	git ls-files | grep flake.nix | perl -pe 's{(/?)flake.nix}{\1result}' | sort >> .bazelignore
	echo cmd/cli/proto >> .bazelignore

update-repos:
	bazel run //:gazelle -- update-repos $$(git ls-files | grep -v tf/terraform | grep 'go.mod' | runmany 'echo -from_file=$$1')

gazelle:
	$(MAKE) bazel-ignore
	$(MAKE) update-repos

build:
	bazel build //...	

get:
	npm install
	npx cdktf get