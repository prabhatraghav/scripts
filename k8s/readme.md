# Kubernetes Cluster - Instructions to configure the multi-node k8s Cluster:
These k8s installation scripts are for Debian-based linux systems which uses 'apt-pacakage-manager' and are tested on Ubuntu-22.04 and Ubuntu-20.04.

# Run the following commands on master-node:
    sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/k8s-master.sh
    sudo chmod 777 k8s-master.sh
    sudo sh k8s-master.sh


# Run the following commands on all the worker-nodes:
    sudo wget https://raw.githubusercontent.com/prabhatraghav/scripts/main/k8s/k8s-worker.sh
    sudo chmod 777 k8s-worker.sh
    sudo sh k8s-worker.sh


# In the last, copy the auto-generated token on master-node as-it-is and run it on all the worker-nodes one-by-one.
# You can check the joining status of all the worker-nodes by passing the below command on the master-node:
    sudo kubectl get nodes -o wide
