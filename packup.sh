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

# Iterate over all paths_to_packup
for path in ${paths_to_packup[@]}
do

	echo "Packing up $path"

	# remove prefix
	path_without_prefix=`echo $path | sed "s/$remove_prefix_escaped//"`

	# Create path directory
	mkdir -p $packup_dir/$path_without_prefix

	# Find all directories to packup
	find $path -type d -maxdepth 1 -mindepth 1 | while read dir; do
		echo -e "\tCompressing $dir"
		dir_without_prefix=`echo $dir | sed "s/$remove_prefix_escaped//"`
		# Compress them into their packup directory
		zip -r --filesync $packup_dir/$dir_without_prefix.zip $dir
	done
done
