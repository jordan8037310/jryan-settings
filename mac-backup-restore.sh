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

# non-user config Files
declare -a configbackup=(
'/Applications/DevDesktop/mysql/my.cnf',
# Version number may need to be updated before running
'/usr/local/Cellar/stash-cli/5.3.0/bin/atlassian'
)

for i in "${configbackup[@]}"
do
  echo -n "Restoring ${i} from external to local machine..."
  cp --parents "${BACKUPLOCATION}${i}" "${i}" #>/dev/null 2>&1
  echo ' DONE!'
done
