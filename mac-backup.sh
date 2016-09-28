#!/usr/bin/env bash

# Prior to fresh Mac OS X Install, backup all of the folders you will want to restore right away

BACKUPLOCATION='/Volumes/EXTERNAL/ReformatBackups/YYYYMMDD'

declare -a manbackup=(
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
'/Library/Application Support/MySQL/Workbench/connections.xml'
'/Library/Application Support/MySQL/Workbench/server_instances.xml'
'/Library/Application Support/MySQL/Workbench/wb_options.xml'
)

for i in "${manbackup[@]}"
do
  echo -n 'Backing up $i from local machine to external...'
  cp -rf "~$i" $BACKUPLOCATION #>/dev/null 2>&1
  echo ' DONE!'
done
