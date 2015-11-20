# Subversion Integration for Mattermost

This integration service posts Subversion commits into specific Mattermost channels
via [Mattermost's incoming webhooks](https://github.com/mattermost/platform/blob/master/doc/integrations/webhooks/Incoming-Webhooks.md).

## Requirements

To run this integration you need:

1. A **network connected Subversion server running Python** (Windows / Linux)
2. A **[Mattermost account](http://www.mattermost.org/)** where [incoming webhooks are enabled](https://github.com/mattermost/platform/blob/master/doc/integrations/webhooks/Incoming-Webhooks.md#enabling-incoming-webhooks)

## Microsoft Windows Install
- Download Python 2.7 from [Python.org](https://www.python.org/downloads/) and install it.  
- Download Subversion-Integration-for-Mattermost from [Github](https://github.com/bitbackofen/Subversion-Integration-for-Mattermost/archive/master.zip).  
- Extract the archive to a directory of your choice.  
- Start a command prompt and cd into your Python installation directory: e.g. `cd c:\python27`  
- Install requirements using `Scripts\pip.exe install -r \path\to\Subversion-Integration-for-Mattermost\requirements.txt`
- `cd \path\to\Subversion-Integration-for-Mattermost\`  
- Make a copy of `settings.py.sample`: `copy settings.py.sample settings.py`  
- Edit `settings.py` with a text editor of your choice and change the settings to your needs  
- Edit `post-commit.bat` with a text editor of your choice and change the settings to your needs  
- Copy `post-commit.bat` to your Subversion repository / repositories hook directory e.g. `copy post-commit.bat c:\repositories\myrepo\hooks\`
- Commit something to your repository
- Check the configured Mattermost channel for new messages  

## Linux Install
This should work with Linux, too, but I don´t have a Linux machine runnning subversion. 
The file `post-commit.bat` should easily be converted to bash. Please fork me and get this up and running.
