#!/bin/bash

#Welcome Messge

echo "Welcome to Flip Coin Combination Problem"
echo "========================================"
printf "\n";

#Declaring Dictionary and Variable

head_count1=0;
tail_count1=0;
declare -A singlet;

for (( i=0; i<=20; i++ ))
do
	flip1=$(( RANDOM %2+1 ));
	if [ $flip1 -eq 1 ]
	then
		(( head_count1++ ));
		coin1="H";
		singlet[$i]="$coin1";
	else
		 (( tail_count1++ ));
                coin1="T";
                singlet[$i]="$coin1";
        fi
done


single_result=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');
single_count=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');


singlet_percentage=`echo $single_count| awk '{print ($1/20)*100}'`;

echo "Singlet Dictionary : " ${singlet[@]};
echo "$single_result reached $single_count times";
echo "Singlet Percentage : $singlet_percentage %";
echo "=============================================";
printf "\n";
