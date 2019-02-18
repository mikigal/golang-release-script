#!/bin/bash
echo 'golang-relase-script by mikigal (https://github.com/mikigal)'
echo ''

WINDOWS_386=(
  windows # GOOS
  386 # GOARCH
  tinify.exe # Compiled binary name
  tinify-win32 # Zipped name, without '.zip'
)

WINDOWS_amd64=(
  windows
  amd64
  tinify.exe
  tinify-win64
)

LINUX_386=(
  linux
  386
  tinify
  tinify-linux32
)

LINUX_amd64=(
  linux
  amd64
  tinify
  tinify-linux64
)

DARWIN_amd64=(
  darwin
  amd64
  tinify
  tinify-macos
)



VERSION='-'$1 # Get version from CLI
if [[ $1 = '' ]]; then
    VERSION=''
fi

function build {
  echo 'Currently building: GOOS='$1'; GOARCH='$2'; BINARY='$3'; ZIP='$4$VERSION'.zip' # Debug
  env GOOS=$1 GOARCH=$2 go build -o releases/$3 # Compile to binary
  zip releases/$4$VERSION'.zip' releases/$3 >> /dev/null # Zip binary and rename, disable logging
  rm releases/$3 # Remove unzipped binary
}

mkdir -p releases # Create directory for binaries if does not exists
rm -f releases/* # Remove old binaries

build ${WINDOWS_386[@]}
build ${WINDOWS_amd64[@]}
build ${LINUX_386[@]}
build ${LINUX_amd64[@]}
build ${DARWIN_amd64[@]}
