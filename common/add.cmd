@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

if not exist %~dp0..\%1 (
  echo Specified config file "%1" is not found. Exiting..
  goto :Error
) else (
  call %~dp0..\%1
)

call %~dp0variables.cmd

echo[
echo Adding %programProgId% ProgID...
reg add "HKCR\Applications\%programExeFilename%\shell\open\command" /t REG_SZ /d "%programExePath% ""%%1""" /f
echo Adding %programProgId% ProgID has completed.

if "%setContextMenu%"=="1" (
  echo[
  echo Adding right click context menu options...

  if "%setContextMenuHKCRAllFileSystemObjects%"=="1" (
    reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /v Icon /t REG_SZ /d "%iconPath%" /f
    reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%\command" /t REG_SZ /d "%programExePath% ""%%1""" /f
  )

  if "%setContextMenuHKCRDrive%"=="1" (
    reg add "HKCR\Drive\shell\%contextMenuIconString%" /v Icon /t REG_SZ /d "%iconPath%" /f
    reg add "HKCR\Drive\shell\%contextMenuIconString%\command" /t REG_SZ /d "%programExePath% ""%%1""" /f
  )

  if "%setContextMenuHKCRBackground%"=="1" (
    reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /v Icon /t REG_SZ /d "%iconPath%" /f
    reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundString%\command" /t REG_SZ /d "%programExePath% ""%%V""" /f
  )

  echo Adding right click context menu options has completed.
)

if "%setFileTypeAssociations%"=="1" (
  call %~dp0SetUserFTASetup.cmd

  echo[
  echo Setting %programProgId% file type associations...
  for /F "tokens=*" %%A in (%programFileAssociationsFile%) do %setUserFTAExe% .%%A %programProgId%
  echo Setting %programProgId% file type associations has completed.
)

echo[
echo Script finished.
endlocal
exit /B %errorlevel%

:Error

endlocal
exit /B 1
