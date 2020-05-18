#!/bin/bash
# This script checks each 10 seconds if there are changes to .md files in the current dir and converts them to LaTeX documents using pandoc
while :
do
  for mdfile in *.md; do
    pdffile=${mdfile%.md}.pdf
    if [ $mdfile -nt $pdffile ]; then
      timestamp=$(date "+%d.%m.%Y %H:%M:%S")
      echo "$timestamp - Now compiling $mdfile to $pdffile."
      if [[ "$1" == "-n" ]]; then
      	pandoc "$mdfile" -N -V lang=de --highlight-style=tango --listings -o "$pdffile" --pdf-engine=xelatex
      else
        pandoc "$mdfile" -V lang=de --highlight-style=tango --listings -o "$pdffile" --pdf-engine=xelatex
      fi
    fi
  done
  sleep 10
done
