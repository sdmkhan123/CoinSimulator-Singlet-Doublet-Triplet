#! /bin/bash -x

flip=$((RANDOM%2))
if [ $flip -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi

