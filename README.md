# Jordan Ryan's Mac Backup Process

This is a simple repository of shell scripts to help with implementing local Mac OS X settings.

## Backup
1. Always run Time Machine Backup first.
2. Update the `BACKUPLOCATION` in `mac-backup.sh` & `mac-backup-restore.sh`
3. Run it `./mac-backup.sh`

## Install Mac OS X Update
1. Run that clean install.
2. Download this repo locally with a ZIP download.
3. Run the config `./mac-config-osx-install.sh`

# Restore Files
1. `./mac-backup-restore.sh`
2. Do it manually for anything that failed. Update this script.

## Manual Installs
1. App Store > Purchased Applications
2. RingCentral Meetings (White-labeled Zoom without a brew cask)
3. Adobe Suite
