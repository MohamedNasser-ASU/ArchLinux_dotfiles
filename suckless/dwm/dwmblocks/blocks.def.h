//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	// {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	{"Battery: ", "acpi -b | grep -E 'Battery|Remaining' | head -n 1 | awk '{print $4, $5, $3}' | tr -d ',' | sed -E 's/([0-9]+)% (.*)/\1% , \2/'", 30, 0},
	{"Vol:", "pamixer --get-volume-human", 5, 10},
	{"", "date '+%b %d (%a) %I:%M%p  '", 5, 0},


};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
