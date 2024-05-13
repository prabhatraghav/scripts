# For UBUNTU 22.04 - EC2-INSTANCE: Atleast minimum 2GB RAM + 2vCPUs - will be required to work Jenkins smoothly.
# sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/jenkins/jenkins.sh
# sudo chmod +x jenkins.sh
# sudo sh jenkins.sh

#!/bin/bash
sudo apt update -y
sudo apt install openjdk-21-jdk -y
sudo apt update -y
sudo apt install maven -y
sudo apt update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
