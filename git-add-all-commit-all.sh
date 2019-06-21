fn ggc() {
	#Here $# holds number of arguments passed to function
	if [ $# = 0 ] ; then
		#Here $(tput setab 1) expands to a color code
		echo "$(tput setab 1)$(tput setaf 7)\nNo commit message received" 
		return 1
	fi
	pp "\nchecking before..."
	git status 
	pp "\nadding files..."
	git add -A
	pp "\nchecking after..."
	git status
	pp "\ncommitting with message $1..."
	git commit -m $1
	#Here $? contains the exit status of the last commmand; 0 is success anything else is failure
	if [ $? = 0 ] ; then
		#Here $(tput sgr0) expands to default color codes
		echo "$(tput setab 2)$(tput setaf 0)\nSuccessfully committed changes$(tput sgr0)"
		pp "\npushing commit..."
		if git push origin ; then
			echo "$(tput setab 2)$(tput setaf 0)\nSuccessfully pushed changes$(tput sgr0)"
			return 0
		else
			echo "$(tput setab 1)$(tput setaf 7)\nFailed to push changes$(tput sgr0)" 
			return 1
		fi
	else
	    echo "$(tput setab 1)$(tput setaf 7)\nFailed to commit changes$(tput sgr0)"
	    return 1
	fi
}
