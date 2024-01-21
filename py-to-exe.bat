@echo off
cd /d %~dp0
del /f /q macrecovery.exe > nul
echo Gathering files...
aria2\aria2c -omacrecovery.py https://github.com/acidanthera/OpenCorePkg/raw/master/Utilities/macrecovery/macrecovery.py
aria2\aria2c -oboards.json https://github.com/acidanthera/OpenCorePkg/raw/master/Utilities/macrecovery/boards.json
echo Installing pyinstaller...
pip install pyinstaller
echo Building...
pyinstaller --noconfirm --onefile --console --add-data "boards.json;."  "macrecovery.py"
move /Y .\dist\macrecovery.exe .\macrecovery.exe > nul
echo Cleaning up...
del /f /q macrecovery.py
del /f /q boards.json
del /f /q macrecovery.spec
rd /s /q dist
rd /s /q build
