#!/usr/bin/env bash

# Don't run as root, messes with permissions of installs

# first run (Uncomment):
#install xcode-cli-tools
#xcode-select --install

#echo -n "Installing homebrew..."
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#echo ' DONE!'

# install caskroom
brew install caskroom/cask/brew-cask

# Need more Taps for ze phps
brew tap homebrew/php

# Set the Applications Directory for Cask Installs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Tap those brews, brew
declare -a brews=(
# Utils
'thefuck'
'wget'
'curl'
'unrar'
'mtr'
# Dev Tools
'git'
'composer'
'webkit2png'
'legit'
# Drupal
'drush'
'terminus'
'drupal-code-sniffer'
# Env
'python'
'memcached'
'php56'
'php56-igbinary'
'php56-memcached'
)

for i in "${brews[@]}"
do
  echo -n "Installing ${i} from homebrew..."
  brew install "$i"
  echo ' DONE!'
done

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
  echo -n "Installing ${i} from caskroom..."
  brew cask install "${i}" >/dev/null 2>&1
  echo " DONE!"
done

# Clean things up
brew update && \
`brew outdated` && \
brew cleanup && \
brew cask cleanup && \
brew doctor &&\
brew tap caskroom/versions
