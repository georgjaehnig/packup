**packup** allows you to create zipped backups, only adding newer files.

# SYNOPSIS

`$ packup.sh`

will in the current directory:
- create a new directory `.packup` 
- iterate over all subdirectories
    - zip them if they:
        - do not exist as a zip file yet
		    - changed between the last run.
    

