#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" --exclude "*.terminal" --exclude "*.json" --exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "Brewfile" -av --no-perms . ~ 
	RECTANGLE_PREFS_PATH="${HOME}/Preferences"
	RECTANGLE_PREFS_FILENAME="com.knollsoft.Rectange.plist"

	mkdir -p "${RECTANGLE_PREFS_PATH}" 
	cp "./${RECTANGLE_PREFS_FILENAME}" "${RECTANGLE_PREFS_PATH}/${RECTANGLE_PREFS_FILENAME}}" 
	source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi

unset doIt
