
for file in ~/.{path,aliases,extras,exports,profile,osx}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

clear

