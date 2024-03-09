# Instructions to configure the multi-node K8s Cluster:

# Run the following commands on master-node:
    sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/k8s-master-node.sh
    sudo chmod 777 k8s-master-node.sh
    sudo sh k8s-master-node.sh


# Run the following commands on all the worker-nodes:
    sudo wget https://raw.githubusercontent.com/prabhatraghav/Deployment-script/main/k8s-worker-nodes.sh
    sudo chmod 777 k8s-worker-nodes.sh
    sudo sh k8s-worker-nodes.sh


# In the last, copy as-it-is the auto-generated token on master-node and paste it & run it on all the worker-nodes one-by-one.
You can check the joining status of all the worker-nodes by passing the below command on the master-node:
    sudo kubectl get nodes -o wide
