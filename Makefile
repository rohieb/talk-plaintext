default: plaintext-gpn19.pdf

IMAGES = $(patsubst %.svg,%.pdf,\
	ASCII_full.svg \
)
PANDOC_PARAMS = \
	 --syntax-definition conflictmarker.xml \
	 --lua-filter latex-center.lua \
	 --lua-filter ub-syntax.lua \

%.pdf: %.svg
	inkscape -z -A $@ $<

plaintext-gpn19.pdf: plaintext-gpn19.md $(IMAGES) Makefile *.lua
	pandoc $(PANDOC_PARAMS) -s -t json $< | jq . > $<.json
	pandoc $(PANDOC_PARAMS) -s -t latex $< > $<.tex
	pandoc $(PANDOC_PARAMS) -s -t beamer -o $@ $<
