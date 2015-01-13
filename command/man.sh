if ! test -f $PROJECT_FILE; then
	shift
fi

if [ -z "$1" ]; then
	if test -f $MANUAL_FILE; then
		cat $MANUAL_FILE
	else
		echo "There is no '$PROJECT' manual."
	fi
else
	if [[ "$1" =~ ^[+-] ]]; then
		if [ "+" = "$1" ]; then
			$EDITOR $MANUAL_FILE
		elif test -f $MANUAL_FILE; then
			local R

			if read "R?Delete '$PROJECT' manual? [y/n] " && [[ "$R" =~ ^[Yy] ]]; then
				rm $MANUAL_FILE
			fi
		else
			echo "There is no '$PROJECT' manual."
		fi
	else
		touch $MANUAL_FILE && echo "$@" >> $MANUAL_FILE
	fi
fi
