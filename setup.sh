#!/usr/bin/env bash

function installBrew() 
{
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installBrew

source ~/.bash_profile

brew bundle

brew cleanup

git submodule update --init
