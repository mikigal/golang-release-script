@echo off
echo golang-relase-script by mikigal (https://github.com/mikigal)
echo.

rem GOOS
set windows_386[0]=windows
rem GOARCH
set windows_386[1]=386
rem Compiled binary name
set windows_386[2]=tinify.exe
rem Zipped name, without '.zip'
set windows_386[3]=tinify-win32

set windows_amd64[0]=windows
set windows_amd64[1]=amd64
set windows_amd64[2]=tinify.exe
set windows_amd64[3]=tinify-win64

set linux_386[0]=linux
set linux_386[1]=386
set linux_386[2]=tinify
set linux_386[3]=tinify-linux32

set linux_amd64[0]=linux
set linux_amd64[1]=amd64
set linux_amd64[2]=tinify
set linux_amd64[3]=tinify-linux64

set darwin_amd64[0]=darwin
set darwin_amd64[1]=amd64
set darwin_amd64[2]=tinify
set darwin_amd64[3]=tinify-macos

set version=-%1
if "%version%"=="-" (
	set "version="
)

if exist "releases" rmdir /Q /S releases
if not exist "releases" mkdir releases

call :build %windows_386[0]% %windows_386[1]% %windows_386[2]% %windows_386[3]%
call :build %windows_amd64[0]% %windows_amd64[1]% %windows_amd64[2]% %windows_amd64[3]%
call :build %linux_386[0]% %linux_386[1]% %linux_386[2]% %linux_386[3]%
call :build %linux_amd64[0]% %linux_amd64[1]% %linux_amd64[2]% %linux_amd64[3]%
call :build %darwin_amd64[0]% %darwin_amd64[1]% %darwin_amd64[2]% %darwin_amd64[3]%

exit /b

:build
echo Currenly building: GOOS=%~1; GOARCH=%~2; BINARY=%~3; ZIP=%~4%version%.zip
set GOOS=%~1
set GOARCH=%~2
go build -o releases\%~3
powershell.exe Compress-Archive releases\%~3 releases\%~4%version%.zip
del releases\%~3