# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

# Note: The legacy package repositories (apt.kubernetes.io and yum.kubernetes.io) have been deprecated and frozen starting from September 13, 2023.
# Using the new package repositories hosted at pkgs.k8s.io is strongly recommended and required in order to install Kubernetes versions released after September 13, 2023.

# Update the apt package index and install packages needed to use the Kubernetes apt repository

sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# Download the public signing key for the Kubernetes package repositories. The same signing key is used for all repositories so you can disregard the version in the URL:
# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the appropriate Kubernetes apt repository. Please note that this repository have packages only for Kubernetes 1.29;
# for other Kubernetes minor versions, you need to change the Kubernetes minor version in the URL to match your desired minor version
# (you should also check that you are reading the documentation for the version of Kubernetes that you plan to install).
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the apt package index, install kubelet, kubeadm and kubectl, and pin their version
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


