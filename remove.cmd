@echo off
setlocal

set contextMenuIconString=Edit with Neovim
set contextMenuBackgroundString=Open Neovim here
set programExeString=nvim-qt.exe

echo[
echo Removing %programExeString% ProgID and coresponding file type associations...
reg delete "HKCR\Applications\%programExeString%" /f

echo[
echo Removing Explorer icon ^& background '%contextMenuIconString%' right click context menu items...
reg delete "HKCR\AllFilesystemObjects\shell\%contextMenuIconString%" /f
reg delete "HKCR\Drive\shell\%contextMenuIconString%" /f
reg delete "HKCR\Directory\Background\shell\%contextMenuBackgroundString%" /f

echo[
echo FINISHED
endlocal
exit /B %errorlevel%
