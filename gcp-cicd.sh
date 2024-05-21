# For UBUNTU (tested on Ubuntu-22.04-LTS-jammy / Ubuntu-24.04-LTS-noble) - EC2-INSTANCE: Atleast minimum 2GB RAM + 2vCPUs - will be required to work Jenkins smoothly.
# sudo wget --header="Authorization: token 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" -O gcp-cicd.sh "https://raw.githubusercontent.com/prabhatraghav/scripts/master/gcp-cicd.sh"
# sudo chmod +x gcp-cicd.sh
# sudo sh gcp-cicd.sh

#!/bin/bash

# Installing Jenkins
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

# Installing Docker Engine:
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo service docker start

# Installing the HashiCorp Terraform
sudo apt-get install gnupg software-properties-common -y
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt-get install terraform -y

# Installing Ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y

# Installing Trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y

# Install the gcloud CLI - https://cloud.google.com/sdk/docs/install
sudo apt-get install apt-transport-https ca-certificates gnupg curl -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update -y
sudo apt-get install google-cloud-cli -y

cat /var/lib/jenkins/secrets/initialAdminPassword
