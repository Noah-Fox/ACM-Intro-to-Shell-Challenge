# ACM Intro to Shell Challenge

This project was created to help teach Linux Shell basics in an OHIO ACM Student Chapter meeting. 

Inside the `materials` directory is the presentation used for the meeting, as well as a Shell Cheat Sheet with basic commands and functionality. 

The challenge consists of a file system located in the `challenge` directory. Instructions are written in `instructions.txt`. To complete the challenge, you must navigate through the file structure and read (and perform operations on) file contents, change file names, and delete files to complete the five tasks described in the instructions.

The program `check-solution.sh` can be run to test if the tasks have been fully completed.

The program `solve.sh` is my solution. Below is an explanation of its code.

## My Solution 

```
for ONFILE in `find challenge`; do 
```
The command `find challenge` recursively lists every file and directory contained anywhere within `challenge`. The for loop iterates through each value, storing the name of each file in the variable `ONFILE`.

Note: it is important to use either `find` or `ls -a` for this. There are hidden files within `emptyDir` that will not be displayed using only `ls`.

```
chmod a+wr $ONFILE
```
This allows the current file to be read from and written to. Some files had permissions modified to add a challenge.

```
FNAME=`basename $ONFILE`
DNAME=`dirname $ONFILE`
```
These commands split up the full path name of `ONFILE` to the file name in `FNAME` and the directories in `DNAME`.

For example, this would split `challenge/firstDir/analysis.txt` into `FNAME=analysis.txt` and `DNAME=challenge/firstDir`

```
if test -f $ONFILE; then 
```
This checks if the current file is a file, and not a directory

```
if [[ -n `echo $FNAME | grep "^removeme"` ]]; then 
    echo REMOVE $ONFILE 
    rm $ONFILE 
```
This checks for files that need to be removed, and deletes them. `grep` uses the regular expression `"^removeme"` to test if the string "removeme" occurs at the beginning of the file name. 

The `echo REMOVE $ONFILE` line is used to display that the deletion is happening (purely for debugging purposes). the `rm $ONFILE` command deletes the file.

```
elif [[ -n `echo $FNAME | grep "^changeme"` ]]; then 
    echo CHANGE $ONFILE 
    mv $ONFILE ${DNAME}/`cat $ONFILE`
```
This checks for files that need to be changed, and changes their title. `grep` tests if the string "changeme" occurs at the beginning of the file name. `mv` renames `ONFILE` to the combined strings of the directories, a slash, and the output of `cat $ONFILE`, which prints the contents of `ONFILE`.

```
elif [[ -n `echo $FNAME | grep "^countme"` ]]; then 
    echo COUNT $ONFILE 
    SUM=0
    for ONNUM in `cat $ONFILE`; do 
        SUM=$(( $SUM + $ONNUM ))
    done 
    mv $ONFILE ${DNAME}/sum${SUM}${FNAME:7:${#FNAME}}
```
This checks for countme files, and changes their title to the sum of their contents. `grep` is used similarly to the previous if statements. A for loop is then used to iterate through the contents of the file, with `SUM` storing the sum so far. Arithmetic expansion is used to add `ONNUM` (the current number from the file's contents) to `SUM`. 

To change the file name, it combines the following strings:

- `${DNAME}` - the directory part of the file path

- `/sum${SUM}` - as per the instructions, replaces the `countme` part of the title with `sumX`, where X is the sum of the contents 

- `${FNAME:7:${#FNAME}}` - this is the substring of `FNAME` from position `7` to its final position (the length of FNAME), which is found using `${#FNAME}`


```
elif [[ -n `echo $FNAME | grep "duplicate$"` ]]; then 
    DUPFILE=${DNAME}/${FNAME::${#FNAME}-10};
    if test -f $DUPFILE; then 
        if [[ -z `diff $DUPFILE $ONFILE` ]]; then 
            echo DUPLICATE $ONFILE 
            rm $ONFILE 
        fi 
    fi 
```
This finds files ending in the string ".duplicate". It then determines the name of the file it might be a duplicate of, using the substring of `FNAME` from position 0 to its 10th-to-last position (".duplicate" has 10 characters).

It checks if this file exists, then uses the `diff` command to check if the files are duplicates. If they are, it removes the .duplicate file.

```
elif [[ -n `grep '\$[0-9][0-9][0-9][0-9]\+-TREASURE-CHEST' $ONFILE` ]]; then 
    echo TREASURE $ONFILE
    mv $ONFILE ${ONFILE}.TREASURE
```
This checks if the string `$X-TREASURE-CHEST` is in the contents of the file. It uses `grep` to search for any matching string that has 4 or more digits. It then adds ".TREASURE" to the end of the file name, if it is found.
