sudo apt update -y

## Install and enable Docker engine
sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/latest-k8s-129/docker-engine.sh -P /tmp
sudo chmod 755 /tmp/docker-engine.sh
sudo bash /tmp/docker-engine.sh
sudo systemctl enable docker.service
sudo systemctl restart docker.service

## Install and enable CRI-Docker CRI (Container Runtime Interface)
sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/latest-k8s-129/cri-dockerd.sh -P /tmp
sudo chmod 755 /tmp/cri-dockerd.sh
sudo bash /tmp/cri-dockerd.sh
sudo systemctl enable cri-docker.service
sudo systemctl restart cri-docker.service

## Install kubernetes (Kubeadm, Kubelet, Kubectl)
sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/latest-k8s-129/install-k8s-v129.sh -P /tmp
sudo chmod 755 /tmp/install-k8s-v129.sh
sudo bash /tmp/install-k8s-v129.sh

## Initialise the k8s-cluster on master-node
sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/latest-k8s-129/start-k8s-cluster.sh -P /tmp
sudo chmod 755 /tmp/start-k8s-cluster.sh
sudo bash /tmp/start-k8s-cluster.sh

sudo rm -r /tmp/docker-engine.sh
sudo rm -r /tmp/cri-dockerd.sh
sudo rm -r /tmp/install-k8s-v129.sh
sudo rm -r /tmp/start-k8s-cluster.sh
sudo rm -r k8s-master-node.sh
