# Create local hidden backup directory.
mkdir -p .packup
# Find all directories to backup.
find * -type d -maxdepth 0 | while read dir; do
	echo "Compressing $dir"
	# Compress them into backup directory
	zip -r --filesync .packup/$dir.zip $dir
done
