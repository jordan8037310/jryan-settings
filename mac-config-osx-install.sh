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

# Need more Taps
declare -a taps=(
# for ze phps
'homebrew/php'
'homebrew/dupes'
'homebrew/versions'
# Ahoy!
'devinci-code/tap'
)

for i in "${taps[@]}"
do
  echo -n "Tapping ${i} from homebrew..."
  brew tap "$i"
  echo ' DONE!'
done

# Set the Applications Directory for Cask Installs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Tap those brews, brew
declare -a brews=(
# Shells
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
'coreutils'
# Dev Tools
'git'
'composer'
'webkit2png'
'legit'
# Drupal
'drush'
'homebrew/php/terminus'
'drupal-code-sniffer'
'homebrew/php/drupalconsole'
# Python
'python'
'python3'
# Platform
'memcached'
'imagemagick'
# PHP
'php56'
'php56-igbinary'
'php56-memcached'
'php71'
'brew-php-switcher'
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
'mamp'
'microsoft-office'
'mysqlworkbench'
'oversight'
'phpstorm'
'plex-home-theater'
'private-internet-access'
'pycharm'
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

open /usr/local/Caskroom/oversight/1.0.0/OverSight_Installer.app && \

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

# Install some Node Utils

# declare the packages
declare -a npms=(
'gulp-cli -g'
'gulp -D'
)

for i in "${npms[@]}"
do
  echo -n "Installing ${i} from npms..."
  npm install "${i}" > /dev/null 2>&1
  echo " DONE!"
done

# Get some random packages that aren't set up with brew
curl -s "http://dn.ringcentral.com/data/web/download/RCMeetings/1210/RCMeetingsClientSetup.pkg"
open RCMeetingsClientSetup.pkg && \
curl -s "http://www.logitech.com/pub/video/quickcam/lws220.dmg"
open lws220.dmg && \
open /Volumes/Logitech\ Webcam\ Software\ v2.2.13/Logitech\ Webcam\ Software.mpkg && \

# Clean things up
brew update && \
`brew outdated` && \
brew cleanup && \
brew cask cleanup && \
brew doctor &&\
brew tap caskroom/versions

# Turn off Gestures in Chrome so you can't swipe back button / forward button on pages
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
