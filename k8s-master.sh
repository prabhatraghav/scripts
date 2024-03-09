## Install and enable Docker engine
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/docker-engine.sh -P /tmp
sudo chmod 755 /tmp/docker-engine.sh
sudo bash /tmp/docker-engine.sh
sudo systemctl enable docker.service
sudo systemctl restart docker.service


## Install and enable CRI-Docker CRI (Container Runtime Interface)
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/cri-dockerd.sh -P /tmp
sudo chmod 755 /tmp/cri-dockerd.sh
sudo bash /tmp/cri-dockerd.sh
sudo systemctl enable cri-docker.service
sudo systemctl restart cri-docker.service

## Install kubernetes (Kubeadm, Kubelet, Kubectl)
sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/latest-k8s-129/install-k8s-v129.sh -P /tmp
sudo chmod 755 /tmp/install-k8s-v129.sh
sudo bash /tmp/install-k8s-v129.sh

sudo swapoff -a

## Initialize kubernetes Master Node
sudo kubeadm init --cri-socket unix:///var/run/cri-dockerd.sock #--ignore-preflight-errors=all

## Create a single-host Kubernetes cluster
# sudo kubeadm init --pod-network-cidr=192.168.0.0/16

## To start using your cluster, you need to run the following as a regular user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

## Install anyone networking driver -- Weave/flannel/canal/calico/cni etc... 

## Installing Calico (https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart)

# Install the Tigera Calico operator and custom resource definitions
#sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/tigera-operator.yaml

#Install Calico by creating the necessary custom resource
#sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/custom-resources.yaml

#Install Calico with default settings
sudo kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/calico.yaml

## Confirm that all of the pods are running (Wait until each pod has the STATUS of Running)
# watch kubectl get pods -n calico-system

# Remove the taints on the control plane (typically used in single-node cluster - it allow pods on master node)
#kubectl taint nodes --all node-role.kubernetes.io/control-plane-
#kubectl taint nodes --all node-role.kubernetes.io/master-

# Confirm that you now have a node in your cluster
sudo kubectl get nodes -o wide

## To generate token in master-node and copy to all the worker-nodes
## (Please integrate the CNI socket by pasting it within the generated token just after the "<master-node-IP>:6443 --cri-socker unix:///var/run/cri-dockerd.sock --token"):
#sudo kubeadm token create --print-join-command
echo "Please copy the below command as it is and paste it to all the worker-nodes to join the k8s-cluster:"
sudo kubeadm token create --print-join-command | sed "s#:6443#& --cri-socker unix:///var/run/cri-dockerd.sock#"
## echo "sudo $(sudo kubeadm token create --print-join-command) --cri-socker unix:///var/run/cri-dockerd.sock"
