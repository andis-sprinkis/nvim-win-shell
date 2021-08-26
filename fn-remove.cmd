@echo off
setlocal enabledelayedexpansion

call %~dp0%1
set contextMenuIconString=Edit with %programName%
set contextMenuBackgroundString=Open %programName% here
set programProgId=Applications\%programExeFilename%

echo[
echo Removing %programExeFilename% ProgID and coresponding file type associations...
for /F "tokens=*" %%A in (%programFileAssociationsFile%) do %setUserFTAExe% del .%%A
reg delete "HKCR\Applications\%programExeFilename%" /f

echo[
echo Removing Explorer icon ^& background '%contextMenuIconString%' right click context menu items...
reg delete "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /f
reg delete "HKCR\Drive\shell\%contextMenuIconString%" /f
reg delete "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /f

echo[
echo FINISHED
endlocal
exit /B %errorlevel%
