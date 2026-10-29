set in  [open "02_innovus_prects.log" r]
set out [open "severity_messages.txt" w]
set n 0

while {[gets $in line] >= 0} {
    incr n
    if {[regexp {^\**(ERROR|WARNING|WARN):? *(.*)$} $line whole sev msg]} {
        puts $out "$n | $sev | $msg"
    }
}

close $in
close $out

