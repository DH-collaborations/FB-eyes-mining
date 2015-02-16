#!/bin/bash

# This script extracts images from PDF files, it uses the command pdfimages
# from the Poppler utility library [http://poppler.freedesktop.org/].

# The script takes two arguments, the first one is the PDF file to extract the
# images from, and the second is the output directory for the extracted images.

name=${1##*/}

if [ ! -d $2 ]
then
    mkdir -p $2
fi

pdfimages -png "$1" "$2/${name%.*}"
