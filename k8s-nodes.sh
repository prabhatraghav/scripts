## Install Docker
sudo wget https://raw.githubusercontent.com/prabhatraghav/devops-labs-scripts/master/scripts/installDocker.sh -P /tmp
sudo chmod 755 /tmp/installDocker.sh
sudo bash /tmp/installDocker.sh
sudo systemctl restart docker.service


## Install CRI-Docker
sudo wget https://raw.githubusercontent.com/prabhatraghav/devops-labs-scripts/master/scripts/installCRIDockerd.sh -P /tmp
sudo chmod 755 /tmp/installCRIDockerd.sh
sudo bash /tmp/installCRIDockerd.sh
sudo systemctl restart cri-docker.service


## Install kubernetes
sudo wget https://raw.githubusercontent.com/prabhatraghav/devops-labs-scripts/master/scripts/installK8S-v1-23.sh -P /tmp
sudo chmod 755 /tmp/installK8S-v1-23.sh
sudo bash /tmp/installK8S-v1-23.sh
