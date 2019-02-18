# golang-release-script
Simply script to cross-platform releasing via one command from CLI. It build and zip binaries for all platforms, with version in zip name (if selected)

For Unix and macOS use `releases.sh`, for Windows `releases.bat`

# How to use
```bash
./release.sh [version number] # for Unix and macOS
release.bat [version number] # for Windows
```
If you want to add more platforms simply add it to script

![img](https://i.imgur.com/2aCuyTG.png)