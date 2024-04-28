#!/bin/bash

# ---------------------------------------------------------------------------- #

BASE_URL="https://github.com/BOJIT/obsidian-template"

# ---------------------------------------------------------------------------- #

function addGitignore() {
	GITIGNORE=".gitignore"

	# Add to .gitignore file if present
	if [ -f "$GITIGNORE" ]; then
		if grep -q "$1" "$GITIGNORE"
		then
			echo "$1 already added to .gitignore"
		else
			echo -en "\n$1" >> "$GITIGNORE"
			echo "Added $1 to .gitignore"
		fi
	fi

    # If not present, place a new .gitignore file in root of vault
}

function getSnippet() {
	URL="$BASE_URL/snippets/$1.code-snippets"
	FILE=".vscode/$1.code-snippets"

	# Download File
	echo "Fetching $URL"
	curl $URL -s --output $FILE

	# Change author name
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		# Linux
		sed -i "s/###AUTHOR###/$AUTHOR/" $FILE
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		# Mac OSX
		sed -i.bak "s/###AUTHOR###/$AUTHOR/" $FILE
		rm $FILE.bak
	fi

	addGitignore $FILE

	echo "---------------------------------------------------------------------"
}

# ---------------------------------------------------------------------------- #

echo "Fetching Obsidian Template..."

echo "---------------------------------------------------------------------"

echo "Template set up in <DIR>". Add instructions here...

# ---------------------------------------------------------------------------- #
