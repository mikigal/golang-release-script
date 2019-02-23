# golang-release-script
Simply script to cross-platform releasing via one command from CLI. It build and zip binaries for all platforms, with version in zip name (if selected)

For Unix and macOS use `releases.sh`, for Windows `releases.bat`.
 
 Alternatively you can use `releases.py`, it works on Windows, Unix nad macOS, but require Python 2 or 3

# How to use
Firsty you need to replace names of binaries and zips in script. Then you can use script
```bash
./release.sh [version number] # for Unix and macOS
release.bat [version number] # for Windows
python releases.py [version number] # Alternative version for every OS
```
If you want to add more platforms simply add it to script

![img](https://i.imgur.com/2aCuyTG.png)