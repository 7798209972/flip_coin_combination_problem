#!/bin/bash

#Welcome Messge

echo "Welcome to Flip Coin Combination Problem"
echo "========================================"
printf "\n";

#Flipping Coin to display Head or Tail

flip1=$(( RANDOM %2+1 ));
if [ $flip1 -eq 1 ]
then
	echo "Head";
else
	echo "Tail";
fi
