#!/bin/sh

#######################################
# Bash script to install an AMP stack and PHPMyAdmin plus tweaks. For Debian based systems.
# Written by @AamnahAkram from http://aamnah.com

# In case of any errors (e.g. MySQL) just re-run the script. Nothing will be re-installed except for the packages with errors.
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

## Install AMP
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt-get install apache2 -y
sudo systemctl restart apache2

echo -e "$Cyan \n Installing MySQL $Color_Off"
sudo apt install mysql-server -y

echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo apt install php libapache2-mod-php php-mysql -y
sudo systemctl restart apache2

echo -e "$Cyan \n Installing Speedtest Backend $Color_Off"
cd
cd /var/www/html/
sudo rm index.html
cd
cd /
sudo git clone https://github.com/librespeed/speedtest.git
cd
sudo cp -a /speedtest/backend/. /var/www/html
IP=$(curl ifconfig.co)
curl -X POST http://159.65.144.39:8887/new_ip/$IP






