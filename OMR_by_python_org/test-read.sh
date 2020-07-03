#!/usr/bin/bash
export SOURCE=source


cd `dirname $0`

pwd

echo "please input your outputfolder"

read OUTPUT
echo "your outputfolder is below"
echo ${OUTPUT}
echo "please target pdf file"
read PDFIFLE
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
python mypdf2jpg.py --inputfilepath ${MYFILE}
mv ./check/*.png ./trash_check

mv ./*png ./${SOURCE}

echo "if you want to next step,please any key"
read TEST



#Convert pdf to png
python scoring.py --read-student-id ${PDFFILE}

#move result
mkdir ${OUTPUT}
mkdir ${OUTPUT}/img
mv *.csv ./${OUTPUT}
mv ./check/*.png ./${OUTPUT}/img
cp *.txt ./${OUTPUT}
