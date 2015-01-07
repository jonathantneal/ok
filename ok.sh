function ok {
	declare ok_editor=vi
	declare ok_dir=$(cd ~/.ok;pwd)

	function _fetch {
		declare ok_cfg="$ok_dir/$1.sh"

		if test -f $ok_cfg; then
			declare -g $2="$(cat $ok_cfg)"

			return 0
		fi

		return 1
	}

	function _app {
		if [ ! -z "$@" ]; then
			eval declare var=\$$1

			if [ "$var" = '$'"$1" ]; then
				var=$1
			fi
		fi

		open -b $app $var
	}

	# require arguments
	if [ $# -gt 0 ]; then
		# if command is a function
		if _fetch "command/$1" cmd; then
			declare cmd_name="$1"

			# if parameter is a project
			if [ $# -gt 1 ] && _fetch "project/$2" project; then
				declare project_name="$2"

				shift; shift; eval "$project; $cmd"

			# otherwise run command with parameter
			else
				shift; eval "$cmd"
			fi
		fi
	else
		cat $ok_dir/manual/ok.txt
	fi
}
