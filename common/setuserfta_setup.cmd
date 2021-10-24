@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

call %~dp0variables.cmd

:SetUserFTASetup
echo[
echo Checking for SetUserFTA utility...

if not exist %utilSetUserFTADirPath% (
  mkdir %utilSetUserFTADirPath%
)

if exist %utilSetUserFTAExeFilePath% (
  echo SetUserFTA found.
  goto :Exit
) else if exist %utilSetUserFTAZipFilePath% (
  echo Extracting SetUserFTA...
  call %~dp0unzip.cmd "%utilSetUserFTADirPath%" "%utilSetUserFTAZipFilePath%"
  echo SetUserFTA extracted.
  rm %utilSetUserFTAZipFilePath%
  goto :Exit
) else (
  echo Downloading SetUserFTA...
  %downloadCmd% %utilSetUserFTAURL% %utilSetUserFTAZipFilePath%
  echo SetUserFTA downloaded.
  goto :SetUserFTASetup
)

:Exit

endlocal
exit /B %errorlevel%
