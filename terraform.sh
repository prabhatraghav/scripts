# For UBUNTU (tested on Ubuntu-22.04-LTS/Ubuntu-24.04-LTS)
# sudo wget --header="Authorization: token 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" -O terraform.sh "https://raw.githubusercontent.com/prabhatraghav/scripts/master/terraform.sh"
# sudo chmod +x terraform.sh
# sudo sh terraform.sh

#!/bin/bash
sudo apt-get update -y

# Installing dependencies
sudo apt-get install gnupg software-properties-common -y

# Installing the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Verifing the Key fingerprints
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Adding the official HashiCorp repository to the APT package manager
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Updating the package information from HashiCorp to the APT package manager
sudo apt update -y

# Installing Terraform from the new repository.
sudo apt-get install terraform -y
