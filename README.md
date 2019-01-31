# scripts
The `bashrc` file in my [dotfiles](https://github.com/veryrad/dotfiles) automatically checks if `~/scripts` exists and adds it to the path, so things should work out of the box.

Each script is explained below, with details and examples for usage, options, configuration, and dependencies.

The aggregate dependencies for all scripts are:
* dmenu
* vim
* basename
* getopts

## dmu ##
The setting I like for `dmenu`.
Just run it.

### Dependencies ###
* *Dmenu* and that's it.

## Journal ##
Saves daily, timestamped entries in markdown format grouped by month.
Allows for maintaining multiple journals for different topics.

### Usage ###
No options are required to use the journal.
Simply calling `journal.sh` will open today's entry in the default journal in Vim.

#### Help (-h) ####
`journal.sh -h` will show the usage.
This is a handy quick reference if you don't feel like refering back to this document.

#### Directory (-d) ####
A specific directory can be specified by using the `-d` option.
For example, entering
```
journal.sh -d foo
```
will record an entry in *foo* rather than the default journal, *main*.


### Configuration ###
The only user configuration is the location of the journal directory and the name of the default journal.
By default, the journal location is `~/documents/journal`. 
This can be changed by editing the `BASE` variable in the `USER CONFIG` section of the script.

The default journal is called *main*.
This is where entries will be recorded is no directory is specified with the `-d` flag, and it meant for the primary, catch-all daily journal.

### Dependencies ###
* *vim* to edit the journal because that's the editor I prefer.
* *basename* to get directory paths.
* *getopts* to parse options.
