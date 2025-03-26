#!/usr/bin/bash

function display_help() 
{
    echo "Usage: $0 [options] [directory_path] [search_pattern]"
    echo
    echo "Options:"
    echo "  -h, --help       Display this help message and exit"
    echo "  -v, --verbose    Enable verbose mode to show detailed output"
    echo "  -s, --silent     Suppress output, logging results only"
    echo
    echo "Examples:"
    echo "  $0 -v -t file.c # Verbose search for 'file.c' and log time taken"
    echo "  $0 -v -t file.c # Verbose search for 'file.c' and log time taken"
    echo "  $0 -v -t directory_path file.c "
    echo
    echo "Note:"
    echo " If no directory is specified, the current directory is used. "
}

VERBOSE=false
SILENT=false
LOGFILE="logs.log"

while [ $# -gt 0 ]
do
    case "$1" in
        -h | --help)
            display_help
            exit 0
            ;;
        -v | --verbose)
            VERBOSE=true
            ;;
        -s | --silent)
            SILENT=true
            ;;
        -vs | -sv)
            VERBOSE=true
            SILENT=true
            ;;
        -*)
            echo "bash error: Invalid option '$1'"
            display_help
            exit 1
            ;;
        /* | ./*)
            DIRECTORY=$1
            ;;
        *)
            if [ -z $PATTERN ]
            then
                PATTERN=$1
            else
                echo "bash error: Invalid pattern"
                display_help
                exit 1
            fi
            ;;
    esac
    shift
done



if [ ! -e ./logs.log ]
then
    touch ./logs.log
fi

if [ $SILENT = "true" ]
then
   exec 1> ./logs.log 2>&1
else
    exec 1> >(tee -a "./logs.log") 2>&1
fi

$VERBOSE && echo "bash: start script"

if [ -z "$PATTERN" ]; then
    echo "bash error: No search pattern provided. Use --help or -h for help."
    display_help
    exit 1
fi

if [ -z $DIRECTORY ]
then
    DIRECTORY=$(pwd)
    $VERBOSE && echo "bash: current directory $DIRECTORY"
fi


tclsh ./find_pattern.tcl $VERBOSE $DIRECTORY $PATTERN 

$VERBOSE && echo "bash: script finish"