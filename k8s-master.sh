## Install Docker
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/docker-engine.sh -P /tmp
sudo chmod 755 /tmp/docker-engine.sh
sudo bash /tmp/docker-engine.sh
sudo systemctl restart docker.service


## Install CRI-Docker
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/cri-dockerd.sh -P /tmp
sudo chmod 755 /tmp/cri-dockerd.sh
sudo bash /tmp/cri-dockerd.sh
sudo systemctl restart cri-docker.service


## Install kubernetes
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/install-k8s-v129.sh -P /tmp
sudo chmod 755 /tmp/install-k8s-v129.sh
sudo bash /tmp/install-k8s-v129.sh

## Initialize kubernetes Master Node
 
sudo kubeadm init --cri-socket unix:///var/run/cri-dockerd.sock --ignore-preflight-errors=all

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


## install networking driver -- Weave/flannel/canal/calico etc... 

## below installs calico networking driver   
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml
