##READ COMMENTS IF YOU WANT TO IDENTIFY VARIABLE NAMES
##FN1=the filename of contents that need to be parsed
####Brewst pieced this together from trash. Don't expect perfection.
##
##
clear
echo "$(tput setaf 1)$(tput bold)$This script parses through a file and finds all IP addresses. It will then sort and count the duplicates if you choose.$(tput sgr 0)"
read -rsn1 -p "Press any key to continue"
echo -e "\nPlease provide name of file you wish to parse through"
read -p "Enter a filename: " FN1
sleep 1
if [[ -f $FN1 ]] ; then
	echo "File $(tput setaf 3)$FN1$(tput sgr 0) found."
sleep 1
else 
	echo "File $(tput setaf 1)$FN1$(tput sgr 0) does not exist. Please check your filename."
	echo "Search failed. Press any key to quit"
	while [ true ] ; do
	read -t 30 -n 1
	if [ $? = 0 ] ; then
	exit ;
	else
	read -p "Enter your name: " AN
	echo "$AN dIdnT pReSs a kEy tO qUiT"
fi
	done

fi
##
##
##
##CM=command analyst chose.
##
##
##
while [ -z "$CM" ] ;
do
echo "Select which action you want performed"
echo
echo "1 - Searches for IP addresses in specified file and then lists them line by line."
echo
echo "2 - Searches for IP addresses in specified file and then sorts them and removes duplicates."
echo
echo "3 - exit"
echo
echo "Select which action you want performed"
printf " Enter selection>";
read CM
##
##
if [ "$CM" -eq 1 ] ; then
	echo "Script will search and build list..."
	sleep 1
elif [ "$CM" -eq 2 ] ; then
	echo "Script will search, sort, and deduplicate results....."
	sleep 1
elif [ "$CM" -eq 3 ] ; then
	echo "You have decided to cancel this action..."
	sleep 1
	exit
else
	echo
	clear
	CM=
fi
done
##
if [ "$CM" -eq 1 ] ; then
	echo "$(tput setaf 2)searching through file$(tput sgr 0)"
	sleep 1
	echo "$(tput setaf 2)Grabbing all IP addresses from file$(tput sgr 0)"
	sleep 1
	grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $FN1 > Unsorted_IP_addresses
	sleep 1
	echo "A File named $(tput setaf 1)Unsorted_IP_addresses(tput sgr 0) has been created in your home directory. This file is a list of unsorted IP addresses"
	read -rsn1 -p "Press any key to quit"
	exit
fi
##
if [ "$CM" -eq 2 ] ; then
	echo "$(tput setaf 2)searching through file$(tput sgr 0)"
	sleep 1
	echo "$(tput setaf 2)Grabbing and sorting IP addresses$(tput sgr 0)"
	sleep 3
	grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $FN1 > Unsorted_IP_addresses
	sort -r Unsorted_IP_addresses | uniq -c > Sorted_IP_addresses 
sleep 1
echo "Removing old unsorted files..."
sleep 3
rm Unsorted_IP_addresses
echo "A File named $(tput setaf 1)Sorted_IP_addresses$(tput sgr 0) has been created in your home directory."
read -rsn1 -p "Press any key to quit"
exit
fi
