#! /bin/bash -x
HeadCount=0
TailCount=0
HHCount=0
HTCount=0
THCount=0
TTCount=0
declare -A Dictionary
declare -A doubletDictionary
declare -A doubletPercentageDictionary
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

for (( i=0; i<num; i++ ))
do
	flip=$((RANDOM%4))
	if [ $flip -eq 0 ]
        then
                HHCount=$(( HHCount + 1 ))
        elif [ $flip -eq 1 ]
                HTCount=$(( HTCount + 1 ))
	elif [ $$flip -eq 2 ]
		THCount=$(( THCount + 1 ))
	else
		TTCount=$(( TTCount + 1 ))
        fi
done
DoubletTatoalFlip=$(( HHCount + HTCount + THCount + TTCount ))
doubletDictionary[0]=$HHCount
doubletDictionary[1]=$HTCount
doubletDictionary[2]=$THCount
doubletDictionary[3]=$TTCount
doubletPercentageDictionary[0]=$( echo $HHCount $DoubletTatoalFlip | awk '{ print 100*$1/$2 }' )
doubletPercentageDictionary[1]=$( echo $HTCount $DoubletTatoalFlip | awk '{ print 100*$1/$2 }' )
doubletPercentageDictionary[2]=$( echo $THCount $DoubletTatoalFlip | awk '{ print 100*$1/$2 }' )
doubletPercentageDictionary[3]=$( echo $TTCount $DoubletTatoalFlip | awk '{ print 100*$1/$2 }' )
