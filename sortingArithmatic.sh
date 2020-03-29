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
function sortAscending() {
	for ((i=0;i<4;i++))
	do
		Smallest=${valuesInArray[i]}
		indexOfSmallest=$i
		for ((j=$i;j<4;j++))
		do
		#finding smallest from i index
		if [ ${valuesInArray[j]} -lt $Smallest ]
		then
			Largest=${valuesInArray[j]}
			indexOfSmallest=$j
		fi
	done
	#swapping the numbers
	temp=${valuesInArray[i]}
	valuesInArray[i]=${valuesInArray[indexOfSmallest]}
	valuesInArray[indexOfSmallest]=$temp
done
}
function performOperations() {
	values["addMultiply"]=$(addMultiply $1 $2 $3)
	values["multiplyAdd"]=$(multiplyAdd $1 $2 $3)
	values["addDivide"]=$(addDivide $1 $2 $3)
	values["modAdd"]=$(modAdd $1 $2 $3)
	#echo ${!values[@]}
	#echo ${values[@]}`
}
function storeInArray() {
	valuesInArray[0]=${values["addMultiply"]}
	valuesInArray[1]=${values["multiplyAdd"]}
	valuesInArray[2]=${values["addDivide"]}
	valuesInArray[3]=${values["modAdd"]}
	#echo $valuesInArray
}
echo "Enter three numbers"
read a b c 
#echo $a $b $c
#perform all operations
performOperations $a $b $c
#store values in array
storeInArray
#sorting
sortDescending 
echo ${valuesInArray[@]}
sortAscending 
echo ${valuesInArray[@]}