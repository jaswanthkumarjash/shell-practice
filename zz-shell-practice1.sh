#!/bin/bash
 
: << 'EOF'
The below script is to check the credentials given are valid or not.
EOF
 
 
echo -n "Enter the user name : "
read user_name
 
users=("jaswanth")
 
declare -A passwords
passwords["${users[0]}"]=123456
 
uf=0
for u in "${users[@]}"; do
    if [[ "$u" == "$user_name" ]]; then
        uf=1
        echo -n "Enter Password: "
        read -s pw
        a=0
        if [[ "${passwords["$u"]}" == "$pw" ]]; then
            echo -e "You have logged in successfully\n"
            a=1
            exit 0
        fi
        if [[ $a == 0 ]]; then
            echo "You entered incorrect password"
            #v=3
            for (( i=0; i<3; i++ ))
            do
                echo "You have $(( 3 - i )) attempts left."
                echo -n "Enter Password Again: "
                read -s pw1
                echo
                if [[ "${passwords["$u"]}" == "$pw" ]]; then
                    echo -e "You have logged in successfully\n"
                    a=1
                    exit 0
                fi
                #v=$(( $v - 1 ))
            done
            if [[ $a == 0 ]]; then
                echo -e "\nYour chances are over to login."
                echo "Do you want to reset your password (type either : Y|N ): "
                read response
                echo
                if [[ "$response" == "Y" ]]; then
                    echo "Need to implement reset password logic."
                    echo -n "Enter new pasword: "
                    read -s p1
                    echo
                    echo -n "Retype new password: "
                    read -s p2
                    echo
                    if [[ "$p1" == "$p2" ]]; then
                        passwords["$user_name"]=$p1
                        echo "Your password is updated."
                    fi
                fi
            fi
        fi
    fi
done