![Image](/img/scheme.png?raw=true)

**packup** allows you to create zipped backups of multiple paths with one command call. It is written in [bash](http://en.wikipedia.org/wiki/Bash_%28Unix_shell%29).

In the given paths, all directories on the first level will be backed (packed) up into a zip file each and saved locally into `~/.packup`. From there, they can be easily synced to any backup device, for example using [rsync](http://en.wikipedia.org/wiki/Rsync).

**packup** uses `zip`'s `--filesync` option, only adding newer files to the zip file, and deleting non-existing ones.

**CAUTION**: Currently in early alpha stage!

# Install

## Requirements

- bash
- A `zip` program understanding the `--filesync` option. 

## Download
```
$ git clone https://github.com/georgjaehnig/packup.git`
$ cd packup
$ cp packuprc.example ~/.packuprc
```

## Edit .packuprc

```
$ vim ~/.packuprc
```

In the variable `paths_to_packup`, list all your paths that contain directories to be packed up. For instance:

```
paths_to_packup=(
/home/johndoe/code
/home/johndoe/texts
)
```

Additionally, specify which prefix of that given paths can be dropped when creating the subdirs in `.packup`, e.g.:
```
remove_prefix=/home/johndoe/
```

# Usage

Simply call:
```
$ ./packup
```

Given for example the following directory structure ...
```
/home/johndoe/code/myblog
/home/johndoe/code/myblog/css
/home/johndoe/code/myblog/js
/home/johndoe/code/mytwitterclone
/home/johndoe/texts/letters
/home/johndoe/texts/novels
```

... **packup** will create the following archives (and directories, if needed):
```
~/.packup/code/myblog.zip
~/.packup/code/mytwitterclone.zip
~/.packup/texts/letters.zip
~/.packup/texts/novels.zip
```

On a later run, the archives will only be touched if the content of their corresponding directory has changed (using `zip`'s `--filesync` option). Thus, if no change happened, a following `rsync` call will omit these archives.
    
