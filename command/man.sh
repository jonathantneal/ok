# if the FIRST ARGUMENT is not empty and the PROJECT FILE does not exist
if [ ! -z "$1" ] && ! test -f $PROJECT_FILE; then
	# drop the FIRST ARGUMENT
	shift
fi

local 'KEY'="$1"
local 'ENTRY'="$@"

# if the KEY is empty
if [ -z "$KEY" ]; then
	# if the MANUAL FILE exists
	if test -f $MANUAL_FILE; then
		cat $MANUAL_FILE
	# otherwise
	else
		echo "There is no '$PROJECT' manual."
	fi
# otherwise
else
	# if the KEY is + or -
	if [[ "$KEY" =~ ^[+-] ]]; then
		# if the KEY is +
		if [ "+" = "$KEY" ]; then
			$EDITOR $MANUAL_FILE
		# otherwise if the PROJECT FILE exists
		elif test -f $MANUAL_FILE; then
			# confirm deletion of the MANUAL FILE
			local R; if read "R?Delete '$PROJECT' manual? [y/n] " && [[ "$R" =~ ^[Yy] ]]; then
				# delete the MANUAL FILE
				rm $MANUAL_FILE
			fi
		# otherwise
		else
			echo "There is no '$PROJECT' manual."
		fi
	# otherwise
	else
		# add the ENTRY to the MANUAL FILE
		touch $MANUAL_FILE && echo "$ENTRY" >> $MANUAL_FILE
	fi
fi
