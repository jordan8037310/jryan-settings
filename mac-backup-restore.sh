#!/usr/bin/env bash

# AFTER fresh Mac OS X Install, restore all of the folders you backed up with mac-backup.sh

BACKUPLOCATION='/Volumes/EXTERNAL/ReformatBackups/YYYYMMDD'

declare -a restorebackup=(
'/.ssh'
'/.bash_profile'
'/.bashrc'
'/.gitconfig'
'/.gitignore_global'
'/.openvpn-connect.json'
'/.drush'
'/GitHub'
'/Sites'
'/Pictures'
'/Downloads'
)

for i in "${restorebackup[@]}"
do
  echo -n 'Restoring $i from external to local machine...'
  cp -rf $BACKUPLOCATION$i "~$i" #>/dev/null 2>&1
  echo ' DONE!'
done

MYSQLWORKBENCHLOCATION='~/Library/Application Support/MySQL/Workbench'

declare -a mysqlworkbenchfiles=(
'connections.xml'
'server_instances.xml'
'wb_options.xml'
)

for i in "${mysqlworkbenchfiles[@]}"
do
  echo -n 'Restoring $i from external to local machine...'
  cp -rf $BACKUPLOCATION$i "~$MYSQLWORKBENCHLOCATION$i" #>/dev/null 2>&1
  echo ' DONE!'
done
