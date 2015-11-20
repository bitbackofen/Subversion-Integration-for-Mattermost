@ECHO OFF
REM *************************************************************
REM * Edit the following lines to suit your environment         *
REM *************************************************************
SET LOGFILE="C:\Svn2Mattermost\log.txt"
SET AUTHORFILE="C:\Svn2Mattermost\author.txt"
REM Set path to svnlook.exe
SET SVNLOOK="C:\Program Files\VisualSVN Server\bin\svnlook.exe"
REM Set path to python.exe
SET PYTHON="C:\Python27\python.exe"
REM Set path to post.py
SET POSTPY="C:\Svn2Mattermost\post.py"

REM *************************************************************
REM * This sets the arguments supplied by Subversion            *
REM *************************************************************
SET REPOS=%1
SET TXN=%2

REM *************************************************************
REM * Get Author and comment                                    *
REM *************************************************************
"%SVNLOOK%" log -r %TXN% %REPOS% > "%LOGFILE%"
"%SVNLOOK%" author -r %TXN% %REPOS% > "%AUTHORFILE%"
set /p COMMENT=<"%LOGFILE%"
set /p AUTHOR=<"%AUTHORFILE%"

REM *************************************************************
REM * Hand it to post.py                                        *
REM *************************************************************
"%PYTHON%" "%POSTPY%" "%AUTHOR% committed revision %TXN% to %REPOS%: %COMMENT%"
exit 0
