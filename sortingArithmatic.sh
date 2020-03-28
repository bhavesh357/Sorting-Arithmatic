#!/bin/bash -x
function addMultiply() {
	echo $(($(($1+$2)) * $3))
}
function multiplyAdd() {
	echo $(($(($1*$2)) + $3))
}
echo "Enter three numbers"
read a b c 
#echo $a $b $c
addMultiply $a $b $c