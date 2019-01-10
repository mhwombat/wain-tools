
#!/usr/bin/gawk -f

BEGIN {
    FS = ","
    OFS = ","
    s = ARGV[1]
    split(s, a, "=")
    if (a[1] == "vars") {
	print a[2] # header for CSV data
	nCols = split (a[2], colNames, ",")
        # print "nCols=" nCols
    } else {
	print "Invalid arguments"
    }
    # for (i = 1; i <= nCols; i++) {
    #     print "DEBUG " i ":" colNames[i]
    # }
}

{
    # print "DEBUG " $0
    # print "DEBUG NF=" NF
    for (i = 1; i <= NF; i++) {
        # print "DEBUG field is '" $(i) "'"
	split($(i), ss, "=")
	colName = ss[1]
	colValue = ss[2]
        # print "DEBUG colName=" colName " colValue=" colValue
	fields[colName] = colValue
    }
    for (i = 1; i <= nCols; i++) {
	colName = colNames[i]
	value = (colName in fields)?fields[colName]:"0"
        # printf "%s", "DEBUG " colName "="
	printf "%s", value
	if (i < nCols) {
	    printf "%s", ","
        }
    }
    print ""
}

END {
}
