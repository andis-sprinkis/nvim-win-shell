set utilSetUserFTAZipFilePath=%~dp0SetUserFTA.zip
set utilSetUserFTADirPath=%~dp0SetUserFTA
set utilSetUserFTAExeFilePath=%utilSetUserFTADirPath%\SetUserFTA\SetUserFTA.exe
set utilSetUserFTAURL=https://kolbi.cz/SetUserFTA.zip
set downloadCmd=bitsadmin /transfer myDownloadJob /download /priority normal
set fileTypeAssociationsFilePath=%~dp0..\filetypes.txt
set contextMenuIconLabel=Edit with %programName%
set contextMenuBackgroundLabel=Open %programName% here
set progID=Applications\%programExeFileName%
