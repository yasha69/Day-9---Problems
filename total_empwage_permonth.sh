#! /bin/bash/ -x
echo "Welcome to emp wage computation"
isPresent='1'
isPartTime='2'
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
PARTTIME_WORKING_HOUR=4
WORKED_DAYS_FOR_MONTH=20
workedDay=1
totalSalary=0
#recivingWag=0

function wageCalculation(){
	local workingHourPerDay=$1
	local wageRecivedPerHour=$2
	local totalSalaryworkedDaysForMonth=$3
	dayWage=$(( $workingHourPerDay * $wageRecivedPerHour ))
	totalSalaryworkedDaysForMonth=$(( $dayWage  + $totalSalaryworkedDaysForMonth ))
	echo $totalSalaryworkedDaysForMonth
}
while [ $workedDay -le $WORKED_DAYS_FOR_MONTH ]
do
checkAttendance=$((RANDOM%3))
	case $checkAttendance in 
		$isPresent)
			echo "Employee is present"
			totalSalary=`wageCalculation $FULL_DAY_HOUR $WAGE_PER_HOUR $totalSalary`
			echo $totalSalary;;
		$isPartTime)
			echo "Employee is doing parttime"
			totalSalary=`wageCalculation $PARTTIME_WORKING_HOUR $WAGE_PER_HOUR $totalSalary`
			echo $totalSalary;;
		*)
			echo "Employee is absent"
	esac
((workedDay++))
done
