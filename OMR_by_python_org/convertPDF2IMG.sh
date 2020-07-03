#!/usr/bin/bash
export SOURCE=source


cd `dirname $0`

pwd

echo "please input your outputfolder"

read OUTPUT
echo "your outputfolder is below"
echo ${OUTPUT}
echo "please target pdf file"
read PDFFILE
echo ${PDFFILE}


echo "delete old result and temporaly files"

mkdir trash_origin
mkdir trash_${SOURCE}
mkdir trash_check
mkdir trash
mv *.csv ./trash
mv ./origin/*.png ./trash_origin
mv ./${SOURCE}/*.png ./trash_${SOURCE}
#convert pdf to image
python mypdf2jpg.py --inputfilePath ${PDFFILE}

