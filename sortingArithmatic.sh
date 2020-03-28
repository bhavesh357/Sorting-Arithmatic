#!/bin/bash -x
#Constants
declare -A values
valuesInArray
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

echo "Enter three numbers"
read a b c 
#echo $a $b $c
values["addMultiply"]=$(addMultiply $a $b $c)
values["multiplyAdd"]=$(multiplyAdd $a $b $c)
values["addDivide"]=$(addDivide $a $b $c)
values["modAdd"]=$(modAdd $a $b $c)
#echo ${!values[@]}
#echo ${values[@]}
valuesInArray=${values[@]}
#echo $valuesInArray