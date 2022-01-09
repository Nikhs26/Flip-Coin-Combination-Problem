#! /bin/bash

echo "Welcome to flip coin combination"

declare -A flipCoin
IS_HEAD=1
counter=0
headCount=0
tailCount=0

read -p "How many times you want to flip coin " noOfTime

#read -p "How many coins you want to flip at same time " noOfCoin

function flipCoinFunction(){

	flipCoinResult=$((RANDOM%2))
	#echo $flipCoinResult

	if [ $flipCoinResult -eq $IS_HEAD ]
	then
		((headCount++))
		echo "H"
	else
		echo "T"
		((tailCount++))
	fi
}

while [ $counter -lt $noOfTime ]
do
		returnValueFromFunction=`flipCoinFunction`
		returnValueFromFunction1=`flipCoinFunction`
		doubletCombination="$returnValueFromFunction$returnValueFromFunction1"
		flipCoin[$counter]=$doubletCombination
		if [ ${flipCoin[$counter]} == 'HH' ]
		then
			((headCount++))
		else
			((tailCount++))
		fi
#		flipCoin[$counter]=`echo ${flipCoin[$counter]}$returnValueFromFunction`
		((counter++))
done

for key in "${!flipCoin[@]}"; do
    echo "$key ${flipCoin[$key]}"
done


echo $headCount $tailCount
#Percentage of  head
percnetageOfHead=$(((($headCount)*100)/$noOfTime))
echo "Percentage of head " $percnetageOfHead

#Percentage of tail
percentageofTail=$((100-$percnetageOfHead))
echo "Percentage of tail "$percentageofTail

