#!/bin/bash -x

echo "Welcome to Flip Coin Combination program"

head=0
randomCheck=$((RANDOM % 2))

if [ $randomCheck == 0 ]
then
        echo "HEADS"
else
        echo "TAILS"
fi

declare -A Singlet

for ((i=1; i<=50; i++))
do
	randomCheck=$((RANDOM % 2))
	if [ $randomCheck == 0 ]
	then
        	echo "HEADS"
		((Singlet[H]++))
	else
		echo "TAILS"
		((Singlet[T]++))
	fi
done

echo ${!Singlet[@]}
echo ${Singlet[@]}

HeadPC=`awk "BEGIN {print (${Singlet[H]}/50)*100}"`
echo "HEAD = $HeadPC%"
TailPC=`awk "BEGIN {print (${Singlet[T]}/50)*100}"`
echo "TAIL = $TailPC%"
