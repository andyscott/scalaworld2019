default:
	nix-shell --run 'make all'

%.pdf : %.tex
	mkdir -p tmp
	mkdir -p out

	TEXINPUTS=src: pdflatex \
		-halt-on-error \
		-output-directory=tmp \
		$<
	mv tmp/$(notdir $@) out/


TEX_FILES := $(patsubst %.tex,%.pdf,$(wildcard src/*.tex))

all:	$(TEX_FILES)

watch:
	nix-shell --run 'watchexec -e tex make'

repl:
	nix repl '<nixpkgs>'
