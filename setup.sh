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
	brew install emacs sl wget
	brew install youtube-dl ffmpeg
	brew install chruby ruby-install
}

function installCasks()
{
	brew cask install sourcetree
	brew cask install appcleaner
	brew cask install istat-menus
	brew cask install transmission
	brew cask install sublime-text
	brew cask install spectacle
	brew cask install paw
	brew cask install hammerspoon
	brew cask install daisydisk
	brew cask install intel-power-gadget
}

git submodule update --init

installBrew

source ~/.bash_profile

installCask

brew tap caskroom/versions

installBins

installCasks
