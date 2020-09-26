#!/bin/bash

#Welcome Messge

echo "Welcome to Flip Coin Combination Problem"
echo "========================================"
printf "\n";

#Declaring Dictionary and Variable

head_count1=0;
tail_count1=0;
head_count2=0;
tail_count2=0;
declare -A singlet;
declare -A doublet;

#Loop for multiple times coin flipping

for (( i=0; i<=20; i++ ))
do
	flip1=$(( RANDOM %2+1 ));
	if [ $flip1 -eq 1 ]
	then
		(( head_count1++ ));
		coin1="H";
		singlet[$i]="$coin1";
		for (( j=$(( i+1 )); j<=20; j++ ))
		do
			(( doublet_count++ ));
			flip2=$(( RANDOM %2+1 ));
			if [ $flip2 -eq 1 ]
			then
				coin2="H";
				(( head_count2++ ));
				doublet[$i]="$coin2$coin1";
			else
				coin2="T";
                                (( tail_count2++ ));
                                doublet[$i]="$coin2$coin1";

	                fi
		done

	else
		 (( tail_count1++ ));
                coin1="T";
                singlet[$i]="$coin1";
                for (( j=$(( i+1 )); j<=10; j++ ))
                do
			(( doublet_count++ ));
                        flip2=$(( RANDOM %2+1 ));
                        if [ $flip2 -eq 1 ]
                        then
                                coin2="H";
                                (( head_count2++ ));
                                doublet[$i]="$coin2$coin1";
                        else
                                coin2="T";
                                (( tail_count2++ ));
                                doublet[$i]="$coin2$coin1";
                        fi
		done

	fi
done

#Sorting Result From Dictionary

single_result=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');
double_result=$(printf '%s\n' "${doublet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');

#Sorting Coumting of Result
single_count=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');
double_count=$(printf '%s\n' "${doublet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');

#Calculating Result
singlet_percentage=`echo $single_count| awk '{print ($1/20)*100}'`;
doublet_percentage=`echo $double_count| awk '{print ($1/20)*100}'`;


#Displaying Details
echo "Singlet Dictionary : " ${singlet[@]};
echo "$single_result reached $single_count times";
echo "Singlet Percentage : $singlet_percentage %";
echo "=============================================";
printf "\n";

echo "Doublet Dictionary"
echo ${doublet[@]};
echo "$double_result reached $double_count times";
echo "Doublet Percentage : $doublet_percentage %";
echo "=============================================";
printf "\n";
