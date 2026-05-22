#!/bin/bash

#------------------------------------------------------------------------------
# docx -> md
# --
# Результат - говно
#-----

# pandoc -f docx -t markdown ./tmp/input.docx -o ./tmp/output.md


#------------------------------------------------------------------------------
# docx -> pdf
# --
# pdflatex not found. Please select a different --pdf-engine or install pdflatex -- see also /usr/share/doc/pandoc/README.Debian
#-----

pandoc -f docx -t pdf ./tmp/input.docx -o ./tmp/output.pdf

#------------------------------------------------------------------------------
# DOC -> MD
# ---
# Не поддерживается.
#
# Unknown input format doc
# Pandoc can convert from DOCX, but not from DOC.
# Try using Word to save your DOC file as DOCX, and convert that with pandoc.
#-----

# pandoc -f doc -t markdown ./tmp/input.doc -o ./tmp/output.md

#------------------------------------------------------------------------------