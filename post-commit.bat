@ECHO OFF
REM *************************************************************
REM * this sets the arguments supplied by Subversion            *
REM *************************************************************
SET REPOS=%1
SET TXN=%2
SET LOGFILE="C:\Svn2Mattermost\log.txt"
SET AUTHORFILE="C:\Svn2Mattermost\author.txt"
"C:\Program Files\VisualSVN Server\bin\svnlook.exe" log -r %TXN% %REPOS% > %LOGFILE%
"C:\Program Files\VisualSVN Server\bin\svnlook.exe" author -r %TXN% %REPOS% > %AUTHORFILE%
set /p COMMENT=<"%LOGFILE%"
set /p AUTHOR=<%AUTHORFILE%
"C:\Python27\python.exe" "C:\Svn2Mattermost\post.py" "%AUTHOR% committed revision %TXN% to %REPOS%: %COMMENT%"
exit 0
