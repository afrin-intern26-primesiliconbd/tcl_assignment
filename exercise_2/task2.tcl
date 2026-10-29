set in  [open "tcl_day3_report_timing_practice.log" r]
set out [open "violated_paths.csv" w]
puts $out "Startpoint,Endpoint,Path Group,Slack"

while {[gets $in line] >= 0} {
    regexp {^Startpoint:\s+(.*\S)} $line whole start
    regexp {^Endpoint:\s+(.*\S)}   $line whole end
    regexp {^Path Group:\s+(\S+)}  $line whole group

    if {[regexp {^slack \(VIOLATED\)\s+(\S+)} $line whole slack]} {
        puts $out "$start,$end,$group,$slack"
    }
}

close $in
close $out


