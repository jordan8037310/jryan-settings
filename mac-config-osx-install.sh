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
brew tap homebrew/dupes
brew tap homebrew/versions

# Taps Ahoy!
brew tap devinci-code/tap

# Set the Applications Directory for Cask Installs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Tap those brews, brew
declare -a brews=(
# Shell
'bash'
'bash-completion'
# install Ahoy V2, --HEAD is required
'ahoy --HEAD'
# Utils
'thefuck'
'wget'
'curl'
'unrar'
'mtr'
'phantomjs'
# Dev Tools
'git'
'composer'
'webkit2png'
'legit'
# Drupal
'drush'
'homebrew/php/terminus'
'drupal-code-sniffer'
# Python
'python'
# Platform
'memcached'
'imagemagick'
# PHP
'php56'
'php56-igbinary'
'php56-memcached'
# Ruby
'ruby'
# Node
'npm'
# Project Management
'atlassian-cli'
)

for i in "${brews[@]}"
do
  echo -n "Installing ${i} from homebrew..."
  brew install "$i"
  echo ' DONE!'
done

# Download miscellaneous config files
## Terminus
terminus help && q # init ~/.terminus
cd ~/.terminus/
wget "https://github.com/pantheon-systems/terminus/blob/master/utils/terminus-completion.bash"

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
'gitter'
'google-chrome'
'google-drive'
'iterm2'
'java'
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
'soapui'
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

# Install some Ruby Utils

# Uncork those casks
declare -a gems=(
'wraith'
)

for i in "${gems[@]}"
do
  echo -n "Installing ${i} from gems..."
  gem install "${i}" >/dev/null 2>&1
  echo " DONE!"
done

# Clean things up
brew update && \
`brew outdated` && \
brew cleanup && \
brew cask cleanup && \
brew doctor &&\
brew tap caskroom/versions
