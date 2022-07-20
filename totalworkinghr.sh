#! /bin/bash/ -x
echo "Welcome to emp wage computation"
isPresent='1'
isPartTime='2'
WAGE_PER_HOUR=20
FULL_DAY_HOUR=8
PARTTIME_WORKING_HOUR=8
WORKED_DAYS_FOR_MONTH=20
TOTAL_WORKING_HOUr_POSSIBLE=100
workedDay=1
totalSalary=0
previousTotalWorkingHour=0

function wageCalculation(){
	local workingHourPerDay=$1
	local wageRecivedPerHour=$2
	local totalSalaryworkedDaysForMonth=$3
	dayWage=$(( $workingHourPerDay * $wageRecivedPerHour ))
	totalSalaryworkedDaysForMonth=$(( $dayWage  + $totalSalaryworkedDaysForMonth ))
	echo $totalSalaryworkedDaysForMonth
}
while [ $workedDay -le $WORKED_DAYS_FOR_MONTH ] && [ $previousTotalWorkingHour -le $TOTAL_WORKING_HOUr_POSSIBLE ]
do
checkAttendance=$((RANDOM%3))
	case $checkAttendance in 
		$isPresent)
			echo "Employee is present"
			totalSalary=`wageCalculation $FULL_DAY_HOUR $WAGE_PER_HOUR $totalSalary`
			previousTotalWorkingHour=$(($previousTotalWorkingHour + $FULL_DAY_HOUR ))
			echo $totalSalary;;
		$isPartTime)
			echo "Employee is doing parttime"
			totalSalary=`wageCalculation $PARTTIME_WORKING_HOUR $WAGE_PER_HOUR $totalSalary`
			previousTotalWorkingHour=$(($previousTotalWorkingHour + $PARTTIME_WORKING_HOUR ))
			echo $totalSalary;;
		*)
			echo "Employee is absent"
	esac
((workedDay++))
done
