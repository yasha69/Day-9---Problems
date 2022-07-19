#! /bin/bash/ -x
echo "Welcome to emp wage computation"
isPresent='1'
checkAttendance=$((RANDOM%2))
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
#workedHour=0
#recivingWag=0
if [ $checkAttendance == $isPresent ]
	then
		echo "Employee is present"
		value=$(( $FULL_DAY_HOUR * $WAGE_PER_HOUR ))
		echo $value
	else
		echo "Employee is absent"
fi
