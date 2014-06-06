# Defaults
packup_dir="~/.packup"

# Defaults can be overwritten by ~/.packuprc
if [ -f ~/.packuprc ]
then
	source ~/.packuprc
fi

# Expand ~ to homedir
eval packup_dir=$packup_dir

if [ -z $paths_to_packup ] 
then
	echo "No paths to packup. Please specify some in your ~/.packuprc"
	exit
fi


# Process remove_prefix to make it suitable for usage with sed
remove_prefix_escaped=`echo $remove_prefix | sed 's/\//\\\\\\//g'`

# Remeber current directory
current_dir=$(pwd)

# Iterate over all paths_to_packup
for path in ${paths_to_packup[@]}
do

	echo "Packing up directories in $path"
	cd $path

	# remove prefix
	path_without_prefix=`echo $path | sed "s/$remove_prefix_escaped//"`

	# Create path directory
	mkdir -p $packup_dir/$path_without_prefix

	# Find all directories to packup

	find * -type d -maxdepth 0  | while read dir; do
		echo -e "Compressing $dir"
		dir_without_prefix=`echo $dir | sed "s/$remove_prefix_escaped//"`
		# Compress them into their packup directory
		zip -r --filesync $packup_dir/$path_without_prefix/$dir.zip $dir
	done
done
cd $current_dir
