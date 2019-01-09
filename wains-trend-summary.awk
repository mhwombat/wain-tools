#!/usr/bin/gawk -f

BEGIN {
    FS = ","
    OFS = ","
    s = ARGV[1]
    split(s, a, "=")
    if (a[1] == "vars") {
	print a[2] # header for CSV data
	nCols = split (a[2], colNames, ",")
    } else {
	print "Invalid arguments"
    }
}

{
    for (i = 1; i <= NF; i++) {
	split($(i), ss, "=")
	colName = ss[1]
	colValue = ss[2]
	fields[colName] = colValue
    }
    for (i in colNames) {
	colName = colNames[i]
	value = (colName in fields)?fields[colName]:"0"
	printf "%s", value
	if (i < nCols)
	    printf "%s", ","
    }
    print ""
}

END {
}
