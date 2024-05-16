# For UBUNTU (tested on Ubuntu-22.04-LTS / Ubuntu-24.04-LTS)
# sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/ansible.sh
# sudo chmod +x ansible.sh
# sudo sh ansible.sh

#!/bin/bash
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y