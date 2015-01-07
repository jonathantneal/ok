# man [project] [value]

declare txt="$ok_dir/manual/${project_name:-$1}.txt"

if [ -z "$project_name" ] || [ $# -eq 0 ]; then
	if test -f $txt; then
		cat $txt
	else
		echo "There is no '$project_name' manual."
	fi
else
	if [ "$1" = "-" ]; then
		read "R?Clear the '$project_name' manual? [y/n] "

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
