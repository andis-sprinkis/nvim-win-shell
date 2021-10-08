@echo off
setlocal enabledelayedexpansion

if not exist %~dp0..\%1 (
  echo Specified config file "%1" is not found. Exiting...
  goto :Error
) else (
  call %~dp0..\%1
)
call %~dp0variables.cmd

call %~dp0SetUserFTASetup.cmd

echo[
echo Removing %progID% file type associations...
for /F "tokens=*" %%A in (%fileTypeAssociationsFilePath%) do %utilSetUserFTAExeFilePath% del .%%A
echo %progID% file type associations removal has completed.

if "%removeOnlyFileTypeAssociations%"=="0" (
  echo[
  echo Removing %progID% ProgID...
  reg delete "HKCR\Applications\%programExeFileName%" /f
  echo %progID% ProgID removal has completed.

  echo[
  echo Removing right click context menu items...
  reg delete "HKCR\AllFilesystemObjects\shell\%contextMenuIconLabel%" /f
  reg delete "HKCR\Drive\shell\%contextMenuIconLabel%" /f
  reg delete "HKCR\Directory\Background\shell\%contextMenuBackgroundLabel%" /f
  echo Right click context menu items removal has completed.
)

echo[
echo Script finished.
endlocal
exit /B %errorlevel%

:Error

endlocal
exit /B 1
