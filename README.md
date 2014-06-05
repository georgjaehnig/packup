**packup** allows you to create zipped backups, only adding newer files.

# SYNOPSIS

`$ packup.sh`

will in the current directory:
- create a new directory `.packup` (if not existing yet) 
- iterate over all subdirectories
    - zip them into `.packup` if they:
        - do not exist as a zip file yet or
        - changed since the last run.
    
The contents of `.packup` can be then [rsync](http://en.wikipedia.org/wiki/Rsync)-ed with a backup drive.

So you end up having your backup data well accessible on your local machine and nicely zipped on your backup drive.

# EXAMPLE

```
$ ls
first
second 
third
$ packup.sh
Compressing first
Compressing second
Compressing third
$ ls .packup/
first.zip
second.zip
third.zip
$ touch first/a.txt
Compressing first
updating: first/ (stored 0%)
  adding: first/a.txt (stored 0%)
Compressing second
Archive is current
Compressing third
Archive is current
```

# REQUIREMENTS

- bash
- A `zip` program understanding the `--filesync` option. 
