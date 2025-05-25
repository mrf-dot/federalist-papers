{
	sum += NF
}

# Beginning of next file
FNR == 1 && ARGIND > 1 {
	totalsum += sum
	count++
	sum = 0
}

END {
	# account for last file
	totalsum += sum
	count++
	# print to terminal
	print "Average words:", totalsum / count
}
