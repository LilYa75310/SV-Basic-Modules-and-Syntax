if {$argc < 2} {
    puts "tcl: invalid args"
    exit 1
}

set verbose [lindex $argv 0]
set dir [lindex $argv 1]
set pattern [lindex $argv 2]
set f_count 0

if {[string match $verbose "true"]} {
    puts "tcl: starting search script"
    puts "verbose: $verbose"
    puts "dir: $dir"
    puts "pattern: $pattern"
}

proc search_pat {verbose dir pattern} {
    global f_count
    foreach file [glob -nocomplain -directory $dir *] {
        if {[file isdirectory $file]} {
            search_pat $verbose $file $pattern
        } elseif {[string match $pattern [file tail $file]]} {
            incr f_count
            if {$verbose} {
                puts "tcl : found matching file at [file normalize $file]"
            } else {
                puts "[file tail $file]"
            }
        }
    }
}

search_pat $verbose $dir $pattern

if {$verbose} {
puts "tcl : total matching files: $f_count"
puts "tcl: search script finished"
}

exit 0