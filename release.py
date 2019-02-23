import sys
import os
import shutil
import zipfile

print("golang-relase-script by mikigal (https://github.com/mikigal)")
print("")

windows_386 = ["windows", "386", "tinify.exe", "tinify-win32"]  # [GOOS, GOARCH, BINARY_NAME, ZIPPED_NAME_WITHOUT_EXTENSION]
windows_amd64 = ["windows", "amd64", "tinify.exe", "tinify-win64"]
linux_386 = ["linux", "386", "tinify", "tinify-linux32"]
linux_amd64 = ["linux", "amd64", "tinify", "tinify-linux64"]
darwin_amd64 = ["darwin", "amd64", "tinify", "tinify-macos"]

version = ""
if len(sys.argv) == 2:
    version = "-" + sys.argv[1]

if os.path.exists("releases"):
    shutil.rmtree("releases")

if not os.path.exists("releases"):
    os.mkdir("releases")

def build(platform):
    print("Currently building: GOOS={0}; GOARCH={1}; BINARY={2}; ZIP={3}.zip".format(platform[0], platform[1], platform[2], platform[3] + version))
    os.environ["GOOS"] = platform[0]
    os.environ["GOARCH"] = platform[1]
    os.system("go build -o releases/" + platform[2])

    zf = zipfile.ZipFile("releases/" + platform[3] + version + ".zip", "w")
    zf.write("releases/" + platform[2])
    zf.close()

    os.remove("releases/" + platform[2])

build(windows_386) # After add new platform remember to build(platform) it
build(windows_amd64)
build(linux_386)
build(linux_amd64)
build(darwin_amd64)
