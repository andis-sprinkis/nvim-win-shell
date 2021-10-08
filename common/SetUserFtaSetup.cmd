@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

call %~dp0variables.cmd

:SetUserFTASetup
echo[
echo Checking for SetUserFTA utility...

if not exist %setUserFTADir% (
  mkdir %setUserFTADir%
)

if exist %setUserFTAExe% (
  echo SetUserFTA found.
  goto :Exit
) else if exist %setUserFTAZip% (
  echo Extracting SetUserFTA...
  call %~dp0unzip.cmd "%setUserFTADir%" "%setUserFTAZip%"
  echo SetUserFTA extracted.
  rm %setUserFTAZip%
  goto :Exit
) else (
  echo Downloading SetUserFTA...
  %downloadCMD% %setUserFTAURL% %setUserFTAZip%
  echo SetUserFTA downloaded.
  goto :SetUserFTASetup
)

:Exit

endlocal
exit /B %errorlevel%
