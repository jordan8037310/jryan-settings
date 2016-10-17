#!/usr/bin/env bash

# Prior to fresh Mac OS X Install, backup all of the folders you will want to restore right away

USERROOT="/Users/jordanryan/"
BACKUPLOCATION="/Volumes/My Book/ReformatBackups/20160929/"

declare -a manbackup=(
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
'Library/Application Support/MySQL/Workbench/*.xml'
)

for i in "${manbackup[@]}"
do
  echo -n "Backing up ${i} from local machine to external..."
  cp -rf "${USERROOT}${i}" "${BACKUPLOCATION}${i}" #>/dev/null 2>&1
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
  echo -n "Backing up ${i} from local machine to external..."
  cp --parents "${i}" "${BACKUPLOCATION}${i}" #>/dev/null 2>&1
  echo ' DONE!'
done
