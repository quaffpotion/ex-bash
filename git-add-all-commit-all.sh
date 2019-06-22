fn ggc() {
	if [ $# = 0 ] ; then
		echo "$(tput setab 1)$(tput setaf 7)\nNo commit message received" 
		return 1
	fi
	pp "\nAdding files..."
	git add -A
	pp "\nChecking after..."
	git status
	if git status | grep -q "nothing" ; then
		echo "$(tput setab 1)$(tput setaf 7)\nNothing new to commit$(tput sgr0)"
		return 1
	fi

	pp "\nCommitting with message \"$1\"..."
	git commit -m $1
	if [ $? = 0 ] ; then
		echo "$(tput setab 2)$(tput setaf 0)\nSuccessfully committed changes$(tput sgr0)"
		pp "\nPushing commit..."
		if git push origin; then
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
