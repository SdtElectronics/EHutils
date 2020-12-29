#!/bin/bash  

known=10

echo ${known} > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio${known}/direction

cd /sys/class/gpio/
for i in $(seq 0 9) $(seq 11 17) $(seq 34 53) $(seq 64 88) $(seq 96 123) $(seq 192 203) $(seq 224 233) $(seq 224 233) $(seq 235 251) $(seq 256 273) $(seq 275 277);
do   
	echo "${i}" > ./export
	echo out > "gpio${i}"/direction
	echo 1 > "gpio${i}"/value
	pre=($(cat ./gpio${known}/value))
	echo 0 > "gpio${i}"/value
	pos=($(cat ./gpio${known}/value))
	if [ ! $pre == $pos ]; then
		echo "gpio${i}"
		echo "${i}" > ./unexport
        exit
	fi
	echo "${i}" > ./unexport
done  


