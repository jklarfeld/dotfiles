#!/usr/bin/env bash

function installBrew() 
{
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function installCask()
{
	brew install caskroom/cask/brew-cask
}

function installBins()
{
	brew install bash-completion bash 
	brew install git git-flow tig
	brew install sqlite xctool
	brew install youtube-dl
	brew install sl wget doxygen
	brew install x264 ffmpeg
}

function installCasks()
{
	brew cask install virtualbox
	brew cask install vagrant
	brew cask install transmission
	brew cask install sickbeard
	brew cask install plex-media-server
	brew cask install appcleaner
	brew cask install sabnzbd
}

installBrew

source ~/.bash_profile

installCask

brew tap caskroom/versions

installBins

installCasks
