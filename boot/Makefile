SHELL := /bin/bash

gen:
	$(MAKE) get
	$(MAKE) rewrite

get: # Generate cue schemas for k8s libraries
	for a in $$(cat k8s.txt); do \
		mark $$a; \
		go get $$a; \
		cue get go $$a; \
	done
	mkdir -p ../k8s
	rsync -ia cue.mod/gen/k8s.io/. ../k8s/.
	rm -rf cue.mod/gen/k8s.io

rewrite: # Rewrite k8s.io module name to this repo
	cd .. && git grep '"k8s.io/' k8s.io | cut -d: -f1 | uniq | while read -r f; do perl -pe 's{"k8s.io/}{"github.com/defn/m/k8s/}' -i $$f; done
