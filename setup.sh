#!/usr/bin/env bash

function installBrew() 
{
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

function installCask()
{
	brew install caskroom/cask/brew-cask
}

function installBins()
{
	brew install bash-completion bash 
	brew install git git-flow
	brew install youtube-dl
	brew install sl wget doxygen
	brew install x264 ffmpeg
}

function installCasks()
{
	brew cask install appcleaner
	brew cask install virtualbox
	brew cask install vagrant
	brew cask install transmission
	brew cask install sabnzbd
	brew cask install sickbeard
	brew cask install plex-media-server
	brew cask install sublime-text
}

installBrew

source ~/.bash_profile

installCask

installBins

installCasks