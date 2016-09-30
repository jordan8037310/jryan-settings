#!/usr/bin/env bash
# Just In case you need to reinstall

# Don't run as root, messes with permissions of installs

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Uncork those casks
declare -a casks=(
'acquia-dev-desktop'
'alfred'
'atom'
'balsamiq-mockups'
'calibre'
'datagrip'
'docker'
'dropbox'
'escape'
'evernote'
'firefox'
'flash'
'flux'
'gdrive'
'google-chrome'
'google-drive'
'iterm2'
'kimono'
'kindle'
'logitech-harmony'
'logitech-unifying'
'microsoft-office'
'mysqlworkbench'
'phpstorm'
'plex-home-theater'
'postbox'
'quickbooks'
'ringcentral'
'screaming-frog-seo-spider'
'silverlight'
'skype'
'slack'
'soundnode'
'sourcetree'
'sublime-text'
'transmit'
'tunnelblick'
'tweetdeck'
'virtualbox'
'vlc'
'zoomus'
)

for i in "${casks[@]}"
do
  echo -n "Uninstalling ${i} from caskroom..."
  brew cask uninstall "${i}"
  echo " DONE!"
done
