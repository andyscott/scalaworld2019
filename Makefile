default:
	nix-shell --run 'make slides'
slides:
	mkdir -p target/aux
	mkdir -p target/out
	pdflatex \
		-aux-directory=target/aux \
		-output-directory=target/out \
		slides.tex
	mv target/out/slides.pdf .
watch:
	nix-shell --run 'watchexec -e tex make slides'
repl:
	nix repl '<nixpkgs>'
