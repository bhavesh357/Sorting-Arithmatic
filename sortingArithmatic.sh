#!/bin/bash -x
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
addMultiply $a $b $c
multiplyAdd $a $b $c
addDivide $a $b $c
modAdd $a $b $c