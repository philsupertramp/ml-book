#!/bin/bash
#

BASE_PATH=$1
BASE_FILENAME=$2

cd /usr/app/$BASE_PATH

mkdir -p /usr/app/build
rm -rf /usr/app/build/*
rm -rf /usr/app/logs/*

PDF_BUILD='pdflatex -synctex=1 -interaction=nonstopmode --shell-escape --enable-write18 -file-line-error -recorder -output-directory="/usr/app/build" "/usr/app/${BASE_PATH}/${BASE_FILENAME}"'
BIB_BUILD='TEXMFOUTPUT=/usr/app/build bibtex /usr/app/build/${BASE_FILENAME}'
BIBER_BUILD='biber --output_directory=/usr/app/build ${BASE_FILENAME}'

if [ ! -f "/usr/app/${BASE_PATH}/${BASE_FILENAME}.tex" ]
then
  echo "File not found in /usr/app/${BASE_PATH}/${BASE_FILENAME}"
  exit
else
  echo "File found."
fi

echo "Running pdflatex (1/3)"
eval "${PDF_BUILD}" > ../build/${BASE_FILENAME}-1.log


echo "Running bibtex (1/1)"
eval "${BIB_BUILD}" > ../build/bibtex.log

#echo "Running ${BIBER_BUILD}"
#set -ex
#echo "Running biber (1/1)"
#eval "${BIBER_BUILD}" > ../build/biber.log
#set +ex

echo "Running pdflatex (2/3)"
eval "${PDF_BUILD}" > ../build/${BASE_FILENAME}-2.log



echo "Running pdflatex (3/3)"
eval "${PDF_BUILD}" > ../build/${BASE_FILENAME}-3.log

mkdir -p /usr/app/logs
mv /usr/app/build/*.log /usr/app/logs
mv /usr/app/build/${BASE_FILENAME}.pdf /usr/app/${BASE_PATH}/${BASE_FILENAME}.pdf
#/bin/rm -rf /usr/app/build/*

exit 0
