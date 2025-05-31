# Makefile for building, linting, and prettifying LaTeX resume using Docker

LATEX_FILE=resume.tex
PDF_FILE=resume.pdf
DOCKER_IMAGE=kjarosh/latex:2025.1

.PHONY: all build lint prettify clean

all: build

# Build PDF using Docker (uses cache)
build:
	docker run --rm -v $(PWD):/src -w /src $(DOCKER_IMAGE) xelatex -jobname=resume -outdir=. -auxdir=/tmp/aux $(LATEX_FILE)

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.lof *.lot *.fls *.fdb_latexmk $(PDF_FILE)
