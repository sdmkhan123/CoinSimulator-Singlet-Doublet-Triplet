#! /bin/bash -x
HeadCount=0
TailCount=0
declare -A Dictionary
read num
for (( i=0; i<num; i++ ))
do
	flip=$((RANDOM%2))
	if [ $flip -eq 0 ]
	then
		HeadCount=$(( HeadCount + 1 ))
	else
		TailCount=$(( TailCount + 1 ))
	fi
done
totalFlip=$(( HeadCount + TailCount ))
Dictionary[0]=$HeadCount
Dictionary[1]=$TailCount
HeadPercentage=$( echo $HeadCount $totalFlip | awk '{ print 100 * $1/$2 }' )
TailPercentage=$( echo $TailCount $totalFlip | awk '{ print 100 * $1/$2 }' )
echo "Head Percentage is : $HeadPercentage %"
echo "Tail Percentage is : $TailPercentage %"
