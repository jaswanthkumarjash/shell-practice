do installation
check for installation
add functions
add colors to output

dnf list installed nginx

if [ $? -ne 0 ]; then VALIDATE $? "Nginx" dnf install nginx -y

else

echo "Nginx already exist $G SKIPPING $N"

fi

dnf list installed python3

if [ $? -ne 0 ]; then dnf install python3 -y VALIDATE $? "python3"

else

echo "Nginx already exist.. $G SKIPPING $N"

0

fi

I