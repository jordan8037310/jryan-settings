#!/usr/bin/env bash

# AFTER fresh Mac OS X Install, restore all of the folders you backed up with mac-backup.sh

USERROOT="/Users/jordanryan/"
BACKUPLOCATION="/Volumes/My Book/ReformatBackups/20160929/"

declare -a restorebackup=(
'.ssh'
'.bash_profile'
'.bashrc'
'.gitconfig'
'.gitignore_global'
'.openvpn-connect.json'
'.drush'
'GitHub'
'Sites'
'Pictures'
'Downloads'
)

for i in "${restorebackup[@]}"
do
  echo -n "Restoring ${i} from external to local machine..."
  cp -rf "${BACKUPLOCATION}${i}" "${USERROOT}${i}" #>/dev/null 2>&1
  echo ' DONE!'
done

MYSQLWORKBENCHLOCATION="/Library/Application Support/MySQL/Workbench/"

declare -a mysqlworkbenchfiles=(
'*.xml' # Get all XML Config Files
)

for i in "${mysqlworkbenchfiles[@]}"
do
  echo -n "Restoring ${i} from external to local machine..."
  cp --parents "${BACKUPLOCATION}${i}" "${USERROOT}${MYSQLWORKBENCHLOCATION}${i}" #>/dev/null 2>&1
  echo ' DONE!'
done
