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
head_count3=0;
tail_count3=0;
doublet_count=0;
triplet_count=0
declare -A singlet;
declare -A doublet;
declare -A triplet;

#Loop for multiple times coin flipping

for (( i=0; i<=10; i++ ))
do
	flip1=$(( RANDOM %2+1 ));
	if [ $flip1 -eq 1 ]
	then
		(( head_count1++ ));
		coin1="H";

		#Storing in Singlet Dictionary

		singlet[$i]="$coin1";
		for (( j=$(( i+1 )); j<=20; j++ ))
		do
			(( doublet_count++ ));
			flip2=$(( RANDOM %2+1 ));
			if [ $flip2 -eq 1 ]
			then
				coin2="H";
				(( head_count2++ ));

				#Storing in Doublet Dictionary

				doublet[$i]="$coin2$coin1";

				for (( k=$(( j+1 )); k<=20; k++ ))
				do
					(( triplet_count++ ));
					flip3=$(( RANDOM %2+1 ));
					if [ $flip3 -eq 1 ]
					then
						(( head_count3++ ));

						#Storing in Triplet Dictionary

						triplet[$i]="H$coin2$coin1";
					else
						(( tail_count3++ ));
						triplet[$i]="T$coin2$coin1";
					fi
				done
			else
				coin2="T";
                                (( tail_count2++ ));
                                doublet[$i]="$coin2$coin1";

                                for (( k=$(( j+1 )); k<=20; k++ ))
                                do
					(( triplet_count++ ));
                                        flip3=$(( RANDOM %2+1 ));
                                        if [ $flip3 -eq 1 ]
                                        then
                                                (( head_count3++ ));
                                                triplet[$i]="H$coin2$coin1";
                                        else
                                                (( tail_count3++ ));
                                                triplet[$i]="T$coin2$coin1";
                                        fi
                                done
			fi
		done

	else
		 (( tail_count1++ ));
                coin1="T";
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

                                for (( k=$(( j+1 )); k<=20; k++ ))
                                do
					(( triplet_count++ ));
                                        flip3=$(( RANDOM %2+1 ));
                                        if [ $flip3 -eq 1 ]
                                        then
                                                (( head_count3++ ));
                                                triplet[$i]="H$coin2$coin1";
                                        else
                                                (( tail_count++ ));
                                                triplet[$i]="T$coin2$coin1";
                                        fi
                                done
                        else
                                coin2="T";
                                (( tail_count2++ ));
                                doublet[$i]="$coin2$coin1";

                                for (( k=$(( j+1 )); k<=20; k++ ))
                                do
					(( triplet_count++ ));
                                        flip3=$(( RANDOM %2+1 ));
                                        if [ $flip3 -eq 1 ]
                                        then
                                                (( head_count3++ ));
                                                triplet[$i]="H$coin2$coin1";
                                        else
                                                (( tail_count3++ ));
                                                triplet[$i]="T$coin2$coin1";
                                        fi
                                done
                        fi
		done

	fi
done

#Sorting Result From Dictionary

single_result=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');
double_result=$(printf '%s\n' "${doublet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');
triple_result=$(printf '%s\n' "${triplet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $2}');

#Sorting Coumting of Result
single_count=$(printf '%s\n' "${singlet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');
double_count=$(printf '%s\n' "${doublet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');
triple_count=$(printf '%s\n' "${triplet[@]}" | sort | uniq -c | sort -r | head -1 | awk '{print $1}');

#Calculating Percentage
singlet_percentage=`echo $single_count| awk '{print ($1/20)*100}'`;
doublet_percentage=`echo $double_count| awk '{print ($1/20)*100}'`;
triplet_percentage=`echo $triple_count| awk '{print ($1/20)*100}'`;


#Displaying Details
echo "Singlet Dictionary : " ${singlet[@]};
echo "'$single_result' reached $single_count times";
echo "Singlet Percentage : $singlet_percentage %";
echo "=============================================";
printf "\n";

echo "Doublet Dictionary"
echo ${doublet[@]};
echo "'$double_result' reached $double_count times";
echo "Doublet Percentage : $doublet_percentage %";
echo "=============================================";
printf "\n";

echo "Triplet Dictionary"
echo ${triplet[@]};
echo "'$triple_result' reached $triple_count times";
echo "Triplet Percentage : $triplet_percentage %";
echo "=============================================";
printf "\n";

