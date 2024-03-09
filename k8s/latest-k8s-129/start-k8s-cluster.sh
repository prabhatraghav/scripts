## The default behavior of a kubelet was to fail to start if swap memory was detected on a node.
# Swap has been supported since v1.22. And since v1.28, Swap is supported for cgroup v2 only.
# You MUST disable swap if the kubelet is not properly configured to use swap.
# 'sudo swapoff -a' will disable swapping temporarily. To make this change persistent across reboots,
# make sure swap is disabled in config files. like /etc/fstab, systemd.swap, depending how it was configured on your system.
sudo swapoff -a

## You can use tools like netcat to check if a port is open.
#netcat example: nc 127.0.0.1 6443 -v

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
## (Please integrate the CNI socket by pasting it within the generated token just after the "<master-node-IP>:6443 --cri-socket unix:///var/run/cri-dockerd.sock --token"):
#sudo kubeadm token create --print-join-command
echo "Please copy and paste the below command to all the worker-nodes to join the k8s-cluster (use it with "sudo" if u r not a root user):"
sudo kubeadm token create --print-join-command | sed "s#:6443#& --cri-socket unix:///var/run/cri-dockerd.sock#"
## echo "sudo $(sudo kubeadm token create --print-join-command) --cri-socket unix:///var/run/cri-dockerd.sock"
