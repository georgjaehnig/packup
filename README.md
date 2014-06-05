**packup** allows you to create zipped backups, only adding newer files.

# SYNOPSIS

`$ packup.sh`

will in the current directory:
- create a new directory `.packup` 
- iterate over all subdirectories
    - zip them into `.packup` if they:
        - do not exist as a zip file yet or
        - changed between the last run.
    
The contents of `.packup` can be then [rsync](http://en.wikipedia.org/wiki/Rsync)-ed with a backup drive.

So you end up having your backup data well accessible on your local machine and nicely zipped on your backup drive.
