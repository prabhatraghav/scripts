# For UBUNTU (tested on Ubuntu-22.04-LTS/Ubuntu-24.04-LTS)
# sudo wget --header="Authorization: token gxp_Lif5hKpFtxxxx3gEcwcz1eHtu" -O docker.sh "https://raw.githubusercontent.com/prabhatraghav/scripts/master/docker.sh"
# sudo chmod +x docker.sh
# sudo sh docker.sh

#!/bin/bash
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo service docker start
sudo docker run hello-world
