#!/usr/bin/env bash

function installBrew() 
{
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

installBrew

source ~/.bash_profile

brew bundle

brew cleanup

git submodule update --init
