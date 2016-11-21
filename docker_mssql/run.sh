stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"
PASSWORD_ARG="SA_PASSWORD=$PASSWORD"
sudo docker run --name $2 -e 'ACCEPT_EULA=Y' -e $PASSWORD_ARG -p 1433:1433 -d $1