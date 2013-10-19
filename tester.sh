#!/bin/bash

#NOTE: if the valgrind option isn't working, make sure you have valgrind installed

VALGRIND_OPTS= "--leak-check=full --dsymutil=yes --log-file=vgoutput.txt --read-var-info=yes --show-reachable=yes"
IFS='
'
red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m'
bold=`tput bold`
normal=`tput sgr0`
input=`cat input`

if [ ! -e "Main.cpp" ] ; then
    echo "Make sure Main.cpp is in this directory."
    exit 1
elif [ ! -e "solution" ] || [ ! -e "input" ] ; then
    echo "Make sure the 'solution' and 'input' files are in this directory."
    exit 2
fi

g++ -o Test -g Main.cpp

#execute tester without memleak testing
./Test <<EOF > output
$input
EOF

numlines=`wc -l < solution`
numfail=0

for i in `seq 1 $numlines` ; do
    solline=`sed "${i}q;d" solution`
    outline=`sed "${i}q;d" output`
    inline=`sed "${i}q;d" input`
    if [ ! "$solline" = "$outline" ] ; then
        numfail=$((numfail + 1))
        echo -e "********************"
        echo -e "${red}Failed${NC} unit test ${bold}$i${normal}: "
        echo "$inline" 
        echo "Expected: "
        echo "$solline"
        echo "Your program outputted: "
        echo "$outline"
        echo -e "********************\n"
    fi

done

if [ "$1" = "--valgrind" ] ; then #execute command with valgrind
echo -e "${green}Beginning Memory Leak Testing...${NC}"
valgrind $VALGRIND_OPTS ./Test <<EOF > output
$input
EOF
memleak=$? #set flag of possible memory leak.
    if [ $memleak = 0 ] ; then 
        echo -e "${green}...Done. There appear to be no memory leaks.${NC}"
    else
        echo -e "${red}...Done. There are possible memory leaks!${NC}"
    fi
echo
fi  

if [ $numfail = 0 ] ; then
    echo -e "Summary: ${green}All unit tests passed.${NC}"
else
    echo -e "Summary: $numfail / $numlines ${red}${bold}failed${NC}${normal} unit tests."
fi

