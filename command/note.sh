# note [project] [value]

declare txt="$ok_dir/note/${project_name:-$1}.txt"

if [ -z "$project_name" ] || [ $# -eq 0 ]; then
	if test -f $txt; then
		cat $txt
	else
		echo "There is no '$project_name' note."
	fi
else
	if [ "$1" = "-" ]; then
		read "R?Clear the '$project_name' note? [y/n] "

		if [[ "$R" =~ ^[Yy] ]]; then
			rm $txt
		fi
	elif [[ "$1" = "+" ]]; then
		$ok_editor $txt
	else
		touch $txt

		echo $@ >> $txt
	fi
fi
