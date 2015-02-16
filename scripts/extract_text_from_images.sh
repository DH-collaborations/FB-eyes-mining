#!/bin/bash

# This script extracts text from PNG images using the tesseract OCR engine
# [https://code.google.com/p/tesseract-ocr/]. It creates one text per image,
# plus one text file that contains the text from all the images.

# The script takes two arguments, the first is the directory that contains the
# images to be OCRed, and the second the directory where to create the text
# files.

name=${1##*/}

if [ ! -d $2 ]
then
    mkdir -p $2
fi

for file in $1/*.png
do
    fn=${file##*/}

    tesseract "$file" "$2/${fn%.*}" -l eng && \
        cat "$2/${fn%.*}.txt" >> "$2/${name%.*}.txt" || sleep 0
done
