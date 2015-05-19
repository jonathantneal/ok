# if the FIRST ARGUMENT is not empty and the PROJECT FILE does not exist
if [ ! -z "$1" ] && ! test -f $PROJECT_FILE; then
	# drop the FIRST ARGUMENT
	shift
fi

local 'KEY'="$1"
local 'VALUE'="$2"

# if the KEY is empty
if [ -z "$KEY" ]; then
	# if the PROJECT FILE exists
	if test -f $PROJECT_FILE; then
		echo "Current settings:\n" && cat $PROJECT_FILE
	# otherwise
	else
		echo "There is no '$PROJECT' project."
	fi
# otherwise
else
	# if the KEY is + or -
	if [[ "$KEY" =~ ^[+-] ]]; then
		# if the KEY is +
		if [ "+" = "$KEY" ]; then
			$EDITOR $PROJECT_FILE
		# otherwise if the KEY is - and the PROJECT FILE exists
		elif test -f $PROJECT_FILE; then
			# confirm deletion of the PROJECT FILE
			local R; if read "R?Delete '$PROJECT' project? [y/n] " && [[ "$R" =~ ^[Yy] ]]; then
				# delete the PROJECT FILE
				rm $PROJECT_FILE
			fi
		# otherwise
		else
			echo "There is no '$PROJECT' project."
		fi
	# otherwise if the VALUE is not empty
	elif [ ! -z "$VALUE" ]; then
		# define the KEY as the VALUE in the PROJECT FILE
		touch $PROJECT_FILE && echo "local '$KEY'='$VALUE'" >> $PROJECT_FILE
	# otherwise
	else
		# define the 'dir' as the KEY in the PROJECT
		touch $PROJECT_FILE && echo "local 'dir'='$KEY'" >> $PROJECT_FILE
	fi
fi
