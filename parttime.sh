#! /bin/bash/ -x
echo "Welcome to emp wage computation"
isPresent='1'
isPartTime='2'
checkAttendance=$((RANDOM%3))
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
PARTTIME_WORKING_HOUR=4
#workedHour=0
#recivingWag=0

function wageCalculation(){
	local workingHourPerDay=$1
	local wageRecivedPerHour=$2
	value=$(( $workingHourPerDay * $wageRecivedPerHour ))
	echo $value
}

case $checkAttendance in 
	$isPresent)
		echo "Employee is present"
		`echo wageCalculation $FULL_DAY_HOUR $WAGE_PER_HOUR `;;
	$isPartTime)
		echo "Employee is doing parttime"
		`echo wageCalculation $PARTTIME_WORKING_HOUR $WAGE_PER_HOUR`;;
	*)
		echo "Employee is absent"
esac
