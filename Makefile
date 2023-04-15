build:
	@true

all:
	git ls-files | grep flake.nix | perl -pe 's{/?flake.nix}{}' | runmany 'mark $$1; cd ./$$1 && nix build'

ignore:
	echo tf > .bazelignore
	echo node_modules >> .bazelignore
	git ls-files | grep flake.nix | perl -pe 's{/?flake.nix}{/.direnv}' | sort >> .bazelignore

get:
	npm install
	npx cdktf get