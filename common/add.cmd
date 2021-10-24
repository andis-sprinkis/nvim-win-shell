@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

echo[
echo Script common\add.cmd has started.

if not exist %~dp0..\%1 (
  echo Specified config file "%1" is not found. Exiting..
  goto :Error
) else (
  call %~dp0..\%1
)

call %~dp0variables.cmd

echo[
echo Adding %progID% ProgID...
reg add "HKCR\Applications\%programExeFileName%\shell\open\command" /t REG_SZ /d "%programExeFilePath% ""%%1""" /f
echo Adding %progID% ProgID has completed.

if "%setContextMenu%"=="1" (
  echo[
  echo Adding right click context menu options...

  if "%setContextMenuHKCRAllFileSystemObjects%"=="1" (
    reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconLabel%" /v Icon /t REG_SZ /d "%iconFilePath%" /f
    reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconLabel%\command" /t REG_SZ /d "%programExeFilePath% ""%%1""" /f
  )

  if "%setContextMenuHKCRDrive%"=="1" (
    reg add "HKCR\Drive\shell\%contextMenuIconLabel%" /v Icon /t REG_SZ /d "%iconFilePath%" /f
    reg add "HKCR\Drive\shell\%contextMenuIconLabel%\command" /t REG_SZ /d "%programExeFilePath% ""%%1""" /f
  )

  if "%setContextMenuHKCRBackground%"=="1" (
    reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundLabel%" /v Icon /t REG_SZ /d "%iconFilePath%" /f
    reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundLabel%\command" /t REG_SZ /d "%programExeFilePath% ""%%V""" /f
  )

  echo Adding right click context menu options has completed.
)

if "%setFileTypeAssociations%"=="1" (
  call %~dp0setuserfta_setup.cmd

  echo[
  echo Setting %progID% file type associations...
  for /F "tokens=*" %%A in (%fileTypeAssociationsFilePath%) do %utilSetUserFTAExeFilePath% .%%A %progID%
  echo Setting %progID% file type associations has completed.
)

echo[
echo Script common\add.cmd has finished.
endlocal
exit /B %errorlevel%

:Error

endlocal
exit /B 1
