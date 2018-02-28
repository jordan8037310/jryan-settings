#!/usr/bin/env bash

# Do some cleanup
brew update
brew upgrade

# Upgrade all Apps installed by Cask
brew cu --all
brew cu --cleanup