# scripts #
The `bashrc` file in my [dotfiles](https://github.com/veryrad/dotfiles) automatically checks if `~/scripts` exists and adds it to the path, so things should work out of the box.

Each script is explained below, with details and examples for usage, options, configuration, and dependencies.

## Nameing and Extensions ##
Some scripts have a `.sh` extension, while others have no extension at all.
The former I call **scripts**: they are standalone shell scripts that take no arguments.
The later I call **utilities**: they are smaller shell scripts that **require** an argument. These are typically used by multiple scripts, and can be thought of like shared libraries. 

## Dependencies ##
The aggregate dependencies are:
```
dmenu vim basename getopts
```
The specific usages are detailed in the Documentation sections, but for a quick start yank the list of packages and install them with your package manager.

## Script Documentation ##

### dmu.sh ###
The setting I like for *dmenu*.
Just run it.

#### Dependencies ####
* *Dmenu* and that's it.

### journal.sh ###
Saves daily, timestamped entries in markdown format grouped by month.

#### Usage ####
No options are required to use the journal.
Simply calling 
```
$ journal.sh
``` 
will open today's entry in the default journal in Vim.

#### Configuration ####
The only user configuration is the location of the journal directory.
By default, the journal location is `~/notebook/journal`. 
This can be changed by editing the `$JOURNAL` variable in the `USER CONFIG` section at the beginning of the script.

#### Dependencies ####
* *vim* to edit the journal because that's the editor I prefer.
* *basename* to get directory paths.
* *getopts* to parse options.

## Utlility Documentation ##

### append ###
Adds a newline to the end of a file and opens the file with vim in insert mode at that new line.

#### Dependencies ####
Just *vim*.

#### Usage ###
```
$ append [foo]
```
where `[foo]` is the file to append.

### timestamp ###
Concatenates a human-readable (but *date* parsable) timestamp.

#### Usage ####
```
$ timestamp [foo]
```
where '[foo]' is the file to timestamp 

### datestamp ###
Checks a file for a datestamp for today's date and creates on if not already existant.

#### Usage ####
```
$ datestamp [foo]
```
where '[foo]' is the file to datestamp.
