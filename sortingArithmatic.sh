#!/bin/bash -x
#Constants
totalOperations=4
#Variables
declare -A values
declare -a valuesInArray
declare -a ascendingArray
declare -a descendingArray
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
function performOperations() {
	values["addMultiply"]=$(addMultiply $1 $2 $3)
	values["multiplyAdd"]=$(multiplyAdd $1 $2 $3)
	values["addDivide"]=$(addDivide $1 $2 $3)
	values["modAdd"]=$(modAdd $1 $2 $3)
}
function storeInArray() {
	valuesInArray[0]=${values["addMultiply"]}
	valuesInArray[1]=${values["multiplyAdd"]}
	valuesInArray[2]=${values["addDivide"]}
	valuesInArray[3]=${values["modAdd"]}
}
function sort() {
	for ((k=0;k<$totalOperations;k++))
	do
		ascendingArray[k]=${valuesInArray[k]}
		descendingArray[k]=${valuesInArray[k]}
	done
	for ((i=0;i<$totalOperations;i++))
	do
		smallest=${ascendingArray[i]}
		largest=${descendingArray[i]}
		indexOfSmallest=$i
		indexOfLargest=$i
		for ((j=$i;j<$totalOperations;j++))
		do
			#finding smallest from i index
			if [ ${ascendingArray[j]} -lt $smallest ]
			then
				smallest=${ascendingArray[j]}
				indexOfSmallest=$j
			fi
			if [ ${descendingArray[j]} -gt $largest ]
			then
				largest=${descendingArray[j]}
				indexOfLargest=$j
			fi
		done
		tempSmallest=${ascendingArray[i]}
		ascendingArray[i]=${ascendingArray[indexOfSmallest]}
		ascendingArray[indexOfSmallest]=$tempSmallest
		tempLargest=${descendingArray[i]}
		descendingArray[i]=${descendingArray[indexOfLargest]}
		descendingArray[indexOfLargest]=$tempLargest
	done	
}
echo "Enter three numbers"
read a b c 
#perform all operations
performOperations $a $b $c
storeInArray
sort
echo ${ascendingArray[@]}
echo ${descendingArray[@]}