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
flipCoinFunction
flipCoinFunction
#echo "$h1$h2"
((counter++))
done
echo $headCount $tailCount
