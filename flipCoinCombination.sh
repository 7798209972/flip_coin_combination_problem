#!/bin/bash

#Welcome Messge

echo "Welcome to Flip Coin Combination Problem"
echo "========================================"
printf "\n";

#Declaring Dictionary and Variable

head_count1=0;
tail_count1=0;
declare -A singlet;

#Loop for multiple times coin flipping

for (( i=0; i<=20; i++ ))
do
	#Checking Head or Tail
	flip1=$(( RANDOM %2+1 ));
	if [ $flip1 -eq 1 ]
	then
		#Increamenting Count
		(( head_count1++ ));
		coin1="H";
		#Storing in Dictiuonary
		singlet[$i]="$coin1";
	else
		 (( tail_count1++ ));
                coin1="T";
                singlet[$i]="$coin1";
        fi
done

#Sorting Result From Dictionary

single_result=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');

#Sorting Coumting of Result
single_count=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');

#Calculating Result
singlet_percentage=`echo $single_count| awk '{print ($1/20)*100}'`;


#Displaying Details
echo "Singlet Dictionary : " ${singlet[@]};
echo "$single_result reached $single_count times";
echo "Singlet Percentage : $singlet_percentage %";
echo "=============================================";
printf "\n";
