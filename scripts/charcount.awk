BEGIN {
	FS = ""
}

{
	for (i = 1; i <= NF; i++)
		# filter out non alphacharacters
		if ($i ~ /[a-zA-Z]/) {
			freq[tolower($i)]++
			sum++
		}
}

END {
	for (char in freq) {
		# printf "%d (%.2f%%): %c\n", freq[char], (freq[char] / sum) * 100, char | "sort -nr"
		printf "%c %s\n", char, repeat((freq[char] / sum) * 100, "*") | "sort"
	}
}

function repeat(num, c,    str) {
	num = int(num) + ( num - (int(num) > 0))
	for (i = 0; i < num; i++)
		str = str c
	return str
}
