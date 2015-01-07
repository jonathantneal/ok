if [ -z "$@" ]; then
	project_name=$dir
else
	eval declare project_name=\$$1
fi

open $project_name
