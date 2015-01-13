#!/bin/bash
# ok: a script for making super fast bash shortcuts.

function ok {
	local EDITOR="vi"
	local DIRECTORY="$(cd ~/.ok;pwd)"
	local COMMAND="$1"
	local PROJECT="$2"
	local MANUAL_FILE="$DIRECTORY/manual/${2:-ok}.txt"
	local COMMAND_FILE="$DIRECTORY/command/$COMMAND.sh"
	local PROJECT_FILE="$DIRECTORY/project/$PROJECT.sh"
	local COMMAND_SCRIPT
	local PROJECT_SCRIPT

	function READ {
		if test -f $1; then
			declare -g "$2"="$(cat $1)"

			return 0
		fi

		return 1
	}

	if [ ! -z "$COMMAND" ] && READ $COMMAND_FILE COMMAND_SCRIPT; then
		shift

		if [ ! -z "$PROJECT" ] && READ $PROJECT_FILE PROJECT_SCRIPT; then
			shift

			eval "$PROJECT_SCRIPT"
		fi

		eval "$COMMAND_SCRIPT"
	else
		cat $MANUAL_FILE
	fi

	return 0
}
