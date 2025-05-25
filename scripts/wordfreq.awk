/^\s*$/ { next }
{
	gsub(/[[:punct:]]/, "")
	$0 = tolower($0)
	for (i = 1; i <= NF; i++)
		freq[$i]++
}

END {
	for (word in freq)
		print freq[word], word | "sort -nr"
}
