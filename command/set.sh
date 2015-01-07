# set [project] [value]

declare txt="$ok_dir/project/${project_name:-$1}.sh"

if [ -z "$project_name" ]; then
	declare project_name=$1

	shift
fi

if [ $# -eq 0 ]; then
	if test -f $txt; then
		cat $txt
	else
		echo "There is no '$project_name' project."
	fi
else
	if [ "$1" = "-" ]; then
		read "R?Clear the '$project_name' project? [y/n] "

		if [[ "$R" =~ ^[Yy] ]]; then
			rm $txt
		fi
	elif [[ "$1" = "+" ]]; then
		$ok_editor $txt
	else
		touch $txt

		echo "declare $1=$2" >> $txt
	fi
fi
