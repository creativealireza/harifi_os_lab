#Author: Alirza Rahimi

echo "Select the Options:"
echo "01) Make files in Specific Folder"
echo "02) Calcute the Numbers"
echo "03) Enter Username"
echo "04) Enter Password"
echo "05) Positive Negetive Zero"
echo "06) Even or Odd"
echo "07) Create File or Folder Directly in Desktop"
echo "08) Where Am I"
echo "09) Count the Numbers"
echo "10) Remove Everything in the directory"
echo "11) Rename file or folder in current directory"
echo "12) Link to Desktop"
echo "13) Create file with numbers"
echo "14) Find Something Desktop file"
echo "15) Lowercase Uppercase"
echo "16) Change Something in whole document"
echo "17) Sort"
echo "18) Save Directory info into file in current Directory"
echo "19) Find format"
echo "20) Find format with size"

read num

desktop=/home/alireza/Desktop/

case $num in
1)
	echo "Enter the Address:"
	read address
	echo "Enter the File Names:"
	read fileName
	echo "Enter the Number of Files:"
	read number
	mkdir $address
	for ((c = 0; c < $number; c++)); do
		touch $address/$fileName$c
	done
	;;
2)
	echo "Enter the Numbers, Then Enter the Operator:"
	read num1
	read num2
	read operator

	echo "Calculation is:"
	echo "$num1 $operator $num2 is: $(expr $num1 $operator $num2)"
	;;

3)
	echo "Enter your Username:"
	read username
	if [ $username = "Alireza" ]; then
		echo "The Username as $username is Correct."
	else
		echo "Get the Fuck off."
	fi
	;;

4)
	echo "Enter Your Password:"
	read password
	while [ $password != "alireza" ]; do
		echo "The password was WRONG. Enter it again."
		echo "For Quiting Press CTRL + C"
		read password
	done
	echo "Logged in."
	;;

5)
	echo "Enter the Number:"
	read number
	if [ $number -lt 0 ]; then
		echo "The Number is Negetive."
	elif [ $number -gt 0 ]; then
		echo "The Number is Positive."
	else
		echo "The Number is Zero(0)."
	fi
	;;

6)
	echo "Enter the Number:"
	read number
	if [ $(expr $number % 2) -eq 0 ]; then
		echo "Even"
	else
		echo "Odd"
	fi
	;;

7)
	echo "Enter file or folder"
	read option
	echo "Enter name of it:"
	read name
	if [ $option = file ]; then
		touch /home/alireza/Desktop/$name
	else
		mkdir /home/alireza/Desktop/$name
	fi
	;;

8)
	echo "This is the directory you are living in:"
	pwd
	;;

9)
	echo "Enter the Range(minimum then maximum):"
	read min
	read max
	echo ""

	for ((i = $min; i <= $max; i++)); do
		echo $i
	done
	;;

10)
	echo "Enter the directory:"
	read directory
	rm -r $directory/*
	;;

11)
	echo "Enter name of it:"
	read oldName
	echo "Enter new name:"
	read newName

	mv $desktop$oldName $newName
	;;

12)
	echo "Enter file name"
	read fileName
	echo "Enter link name:"
	read link
	ln $fileName $desktop$link
	;;

13)
	echo "Enter min and max:"
	read min
	read max

	touch numbers $desktop
	for ((c = min; c <= max; c++)); do
		echo $c >>numbers
	done
	;;

14)
	echo "Enter Name of File:"
	read fileName
	echo "Enter query:"
	read query
	echo "Result is:"
	cat $fileName | grep $query
	;;

15)
	echo "Enter name of the file:"
	read fileName
	echo "Enter l for LowerCase and u for UpperCase:"
	read option
	if [ $option = "l" ]; then
		cat $fileName | tr "[:upper:]" "[:lower:]"
	elif [ $option = "u" ]; then
		cat $fileName | tr "[:lower:]" "[:upper:]"
	else
		echo "Idiot."
	fi
	;;

16)
	echo "Enter name of the file:"
	read fileName
	echo "Enter the variable you want to change:"
	read var
	echo "Enter the New Name:"
	read newName
	echo "Result is:"

	cat $fileName | sed "s/$var/$newName/g"
	;;

17)
	echo "Enter name of file:"
	read fileName
	echo "Uniq Sort(y/n):"
	read option
	echo "Result is:"
	if [ $option = "y" ]; then
		cat $fileName | sort | uniq
	else
		cat $fileName | sort
	fi
	;;

18)
	echo "Enter Directory:"
	read directory
	echo "Enter File Name:"
	read fileName
	ls -l $directory >$fileName
	echo "Done."
	;;

19)
	echo "Enter Directory you want to search into:"
	read directory
	echo "Enter format:"
	read format

	find $directory -name *.$format
	;;

20)
	echo "Enter Directory:"
	read directory
	echo "Enter format:"
	read format
	echo "Enter min size:"
	read min
	echo "Enter max size:"
	read max

	find $directory -size +$min\M -size -$max\M -name *.$format
	;;
?) echo "You Did NOT Select Any. Run the Program for Further Use." ;;
esac

echo ""
echo "The program is finished!"
