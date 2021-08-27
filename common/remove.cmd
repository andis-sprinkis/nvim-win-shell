@echo off
setlocal enabledelayedexpansion

call %~dp0..\%1

if not exist %~dp0..\%1 (
  echo Specified config file "%1" is not found.
  goto :Error
)

set contextMenuIconString=Edit with %programName%
set contextMenuBackgroundString=Open %programName% here
set programProgId=Applications\%programExeFilename%
set programFileAssociationsFile=%~dp0..\filetypes.txt

echo[
echo Removing %programExeFilename% ProgID and coresponding file type associations...
for /F "tokens=*" %%A in (%programFileAssociationsFile%) do %setUserFTAExe% del .%%A
reg delete "HKCR\Applications\%programExeFilename%" /f

echo[
echo Removing Explorer icon ^& background '%contextMenuIconString%' right click context menu items...
reg delete "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /f
reg delete "HKCR\Drive\shell\%contextMenuIconString%" /f
reg delete "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /f

:Error
endlocal
exit /B 1

echo[
echo FINISHED
endlocal
exit /B %errorlevel%
