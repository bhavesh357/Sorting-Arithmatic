#!/bin/bash -x
#Constants
declare -A values
declare -a valuesInArray
function addMultiply() {
	echo $(($(($1+$2)) * $3))
}
function multiplyAdd() {
	echo $(($(($1*$2)) + $3))
}
function addDivide() {
	echo $(($(($1+$2)) / $3))
}
function modAdd() {
	echo $(($(($1%$2)) + $3))
}
function sortDescending() {
	for ((i=0;i<4;i++))
	do
		Largest=${valuesInArray[i]}
		indexOfLargest=$i
		for ((j=$i;j<4;j++))
		do
		#finding largest from i index
		if [ ${valuesInArray[j]} -gt $Largest ]
		then
			Largest=${valuesInArray[j]}
			indexOfLargest=$j
		fi
	done
	#swapping the numbers
	temp=${valuesInArray[i]}
	valuesInArray[i]=${valuesInArray[indexOfLargest]}
	valuesInArray[indexOfLargest]=$temp
done
}
echo "Enter three numbers"
read a b c 
#echo $a $b $c
values["addMultiply"]=$(addMultiply $a $b $c)
values["multiplyAdd"]=$(multiplyAdd $a $b $c)
values["addDivide"]=$(addDivide $a $b $c)
values["modAdd"]=$(modAdd $a $b $c)
#echo ${!values[@]}
#echo ${values[@]}`
valuesInArray[0]=${values["addMultiply"]}
valuesInArray[1]=${values["multiplyAdd"]}
valuesInArray[2]=${values["addDivide"]}
valuesInArray[3]=${values["modAdd"]}
#echo $valuesInArray
sortDescending 
echo ${valuesInArray[@]}