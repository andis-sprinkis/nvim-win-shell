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
echo Removing %programProgId% file type associations...
for /F "tokens=*" %%A in (%programFileAssociationsFile%) do %setUserFTAExe% del .%%A
echo %programProgId% file type associations removal has completed.

if "%removeOnlyFileTypeAssociations%"=="0" (
  echo[
  echo Removing %programProgId% ProgID...
  reg delete "HKCR\Applications\%programExeFilename%" /f
  echo %programProgId% ProgID removal has completed.

  echo[
  echo Removing right click context menu items...
  reg delete "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /f
  reg delete "HKCR\Drive\shell\%contextMenuIconString%" /f
  reg delete "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /f
  echo Right click context menu items removal has completed.
)

echo[
echo Script finished.
endlocal
exit /B %errorlevel%

:Error

endlocal
exit /B 1
