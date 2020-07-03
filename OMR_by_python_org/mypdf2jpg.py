import pdf2image
import os
import glob
import argparse

# get input from user
parser = argparse.ArgumentParser(description='this program is used for converting pdf to png')
parser.add_argument('--inputfilePath', help='this is path of input file',default="default")
args = parser.parse_args()


dstfolder="origin"
print("current dir is {}".format(os.getcwd()))
currentdir=os.getcwd()

dstpath=currentdir+"/"+dstfolder
dstfiles=os.listdir(dstpath)
files = os.listdir(currentdir)
print("delete all images\n")
file_list = glob.glob(dstpath+"/"+"*png")
for file in file_list:
    print("remove {0}".format(file))
    os.remove(file)


#convert pdf to png
inputfilepath=currentdir+"/"+args.inputfilePath
print("input file path is {}".format(inputfilepath))


if inputfilepath in "default":
    for file in files:
        if '.pdf' in file:
            images = pdf2image.convert_from_path(file, grayscale=False)
            fname = os.path.splitext(file)[0]
            for index, image in enumerate(images):
                image.save(dstpath+"/"+fname + "-" + str(index + 1) + '.png')
        else:
            print("skip this filename\n")
            print("file name is {}\n",file)
else:
    images = pdf2image.convert_from_path(inputfilepath, grayscale=False)
    fname = os.path.splitext(os.path.basename(inputfilepath))[0]
    for index, image in enumerate(images):
        print("save path is {}".format(dstpath+"/"+fname+"-"+str(index+1)+".png"))
        image.save(dstpath + "/" + fname + "-" + str(index + 1) + '.png')

