!#/bin/bash

#Author:Ann 
#date :10252022
# script to install Sonarqube on centos7 serve


echo "Sonarqube doesnt work when you start it as root user so please exit root"

su - vagrant

echo "installation will begin in a few seconds ...."
sleep 4
echo "updating yum"

sudo yum update -y

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

echo "Downloading SonarQube latest versions on server"

cd /opt

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

if [ $? nq 0]

then 
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
else 
echo "wget is installed"
fi

echo " Extracting packages"

sudo unzip /opt/sonarqube-9.3.0.51899.zip

#if [ $? nq 0]
#sudo unzip /opt/sonarqube-9.3.0.51899.zip
#sudo unzip /opt/sonarqube-9.3.0.51899.zip
#else
#echo "install sucessful"
#fi

echo "Change ownership to the user and Switch to Linux binaries directory to start service"

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
 ./sonar.sh start 

 sleep 6

 echo "Connect to the SonarQube server through the browser. It uses port 9000." 

 #http://localhost:9000/

 sudo firewall-cmd --permanent --add-port=9000/tcp
 sudo firewall-cmd --reload

 Echo "installation complete!!!! ... you can listen on port 9000"


