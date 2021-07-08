#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" --exclude "*.terminal" --exclude "*.json" --exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "Brewfile" -av --no-perms . ~ 
	SHORTCUTPATH="${HOME}/Library/Application Support/Spectacle"
	mkdir -p "${SHORTCUTPATH}" 
	cp ./Spectacle-Shortcuts.json "${SHORTCUTPATH}"/Shortcuts.json 
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
