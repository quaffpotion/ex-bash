fn ggc() {
	if [ $# = 0 ] ; then
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
	if [ $? = 0 ] ; then
		echo "$(tput setab 2)$(tput setaf 0)\nSuccessfully committed changes$sdc"
		pp "\npushing commit..."
		if git push origin ; then
			echo "$(tput setab 2)$(tput setaf 0)\nSuccessfully pushed changes$sdc"
			return 0
		else
			echo "$(tput setab 1)$(tput setaf 7)\nFailed to push changes$sdc" 
			return 1
		fi
	else
	    echo "$(tput setab 1)$(tput setaf 7)\nFailed to commit changes$sdc"
	    return 1
	fi
}
