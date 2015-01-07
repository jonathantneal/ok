# config [command]

declare txt="$ok_dir/command/${project_name:-$1}.sh"

if [ -z "$project_name" ] && [ $# -eq 0 ]; then
	if test -f $txt; then
		cat $txt
	else
		echo "There is no '$project_name' command."
	fi
else
	if [ "$1" = "-" ]; then
		read "R?Clear the '$project_name' command? [y/n] "

		if [[ "$R" =~ ^[Yy] ]]; then
			rm $txt
		fi
	else
		$ok_editor $txt
	fi
fi
