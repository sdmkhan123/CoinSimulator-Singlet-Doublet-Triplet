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
declare -A tripletDictionary
declare -A tripletPercentageDictionary
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
	then
                HTCount=$(( HTCount + 1 ))
	elif [ $flip -eq 2 ]
	then
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

echo "doublet count " ${doubletDictionary[*]}
echo "doublet Percentage " ${doubletPercentageDictionary[*]}

for (( i=0; i<num; i++ ))
do
	flip=$(( RANDOM % 8 ))
	ValueCount=${tripletDictionary[$flip]}
	ValueCount=$((ValueCount + 1))
	tripletDictionary[$flip]=$ValueCount
done

TripletTotalFlip=0
for (( i=0; i<8; i++ ))
do
	ValueCount=${tripletDictionary[$i]}
	TripletTotalFlip=$(( TripletTotalFlip + ValueCount ))
done

for (( i=0; i<8; i++ ))
do 
        ValueCount=${tripletDictionary[$i]}
	percentage=$( echo $ValueCount $TripletTotalFlip | awk '{ print 100*$1/$2 }' )
	tripletPercentageDictionary[$i]=$percentage
done
echo "triplet count " ${tripletDictionary[*]}
echo "triplet percentage " ${tripletPercentageDictionary[*]}
