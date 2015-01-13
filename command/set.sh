if ! test -f $PROJECT_FILE; then
	shift
fi

if [ -z "$1" ]; then
	if test -f $PROJECT_FILE; then
		cat $PROJECT_FILE
	else
		echo "There is no '$PROJECT' project."
	fi
else
	if [[ "$1" =~ ^[+-] ]]; then
		if [ "+" = "$1" ]; then
			$EDITOR $PROJECT_FILE
		elif test -f $PROJECT_FILE; then
			local R

			if read "R?Delete '$PROJECT' project? [y/n] " && [[ "$R" =~ ^[Yy] ]]; then
				rm $PROJECT_FILE
			fi
		else
			echo "There is no '$PROJECT' project."
		fi
	elif [ ! -z "$2" ]; then
		touch $PROJECT_FILE && echo "local '$1'='${@:2}'" >> $PROJECT_FILE
	else
		cat $PROJECT_FILE
	fi
fi
