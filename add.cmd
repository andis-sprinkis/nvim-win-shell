@echo off
setlocal
cd /d %~dp0

set setUserFTAZip=%~dp0SetUserFTA.zip
set setUserFTADir=%~dp0SetUserFTA
set setUserFTAExe=%setUserFTADir%\SetUserFTA\SetUserFTA.exe
set setUserFTAURL=https://kolbi.cz/SetUserFTA.zip
set downloadCMD=bitsadmin /transfer myDownloadJob /download /priority normal
set programExePathFile=%~dp0path.txt
set programFileAssociationsFile=%~dp0filetypes.txt
set contextMenuIconString=Edit with Neovim
set contextMenuBackgroundString=Open Neovim here
set programExeString=nvim-qt.exe

for /f %%a in (%programExePathFile%) do (
  set programExePath=%%a
  break
)

echo[
echo Setting up SetUserFTA utility to add %programExeString% ProgID file type associations...
:SetUserFTASetup
if exist %setUserFTAExe% (
  goto :MainSetup
) else if exist %setUserFTAZip% (
  echo[
  echo - Unzipping SetUserFTA utility...
  call :UnZipFile "%setUserFTADir%" "%setUserFTAZip%"
  rm %setUserFTAZip%
  goto :MainSetup
) else (
  echo[
  echo - Downloading SetUserFTA utility...
  %downloadCMD% %setUserFTAURL% %setUserFTAZip%
  goto :SetUserFTASetup
)

:MainSetup

echo[
echo Setting nvim-qt.exe ProgID...
reg add "HKCR\Applications\%programExeString%\shell\open\command" /t REG_SZ /d "%programExePath% ""%%1""" /f

echo[
echo Setting Explorer icon ^& background '%contextMenuIconString%' right click context menu option...
reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /v Icon /t REG_SZ /d "%programExePath%" /f
reg add "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%\command" /t REG_SZ /d "%programExePath% ""%%1""" /f
reg add "HKCR\Drive\shell\%contextMenuIconString%" /v Icon /t REG_SZ /d "%programExePath%" /f
reg add "HKCR\Drive\shell\%contextMenuIconString%\command" /t REG_SZ /d "%programExePath% ""%%1""" /f
reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /v Icon /t REG_SZ /d "%programExePath%" /f
reg add "HKCR\Directory\Background\shell\%contextMenuBackgroundString%\command" /t REG_SZ /d "%programExePath% ""%%V""" /f

echo[
echo Setting the file type associations...
%setUserFTAExe% %programFileAssociationsFile%

echo[
echo FINISHED
endlocal
exit /B %errorlevel%

:: VBS to exract ZIP files
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\unzip.vbs"
>>%vbs% echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%

exit /B 0
