echo "updating repository"
sudo apt-get update
sleep 5
echo "installing docker"
sudo apt install docker.io -y
sleep 5
echo "checking docker version"
sudo docker --version
sleep 5
echo "Downloading the kubectl latest release with this command"
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
"
sleep 5
echo "Installing kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sleep 5
echo "Check the version"
sudo kubectl version --client
sleep 5
echo "install rancher/k3d using curl"
sudo curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
echo "installed k3d"
echo "creating a single node cluster(only control-plane node)"
sudo k3d cluster create mycluster
sleep 5
echo "getting control-plane  node"
sudo kubectl get nodes
echo "This is the control-plane/master node"
sleep 5
echo "Getting the cluster’s kubeconfig"
sudo k3d kubeconfig merge mycluster --kubeconfig-switch-context
sleep 5
echo "Creating Multi-Server Clusters"
sudo k3d cluster create multinode --agents 2 --servers 1
sleep 5
echo "Showing the nodes which we have created"
sudo kubectl get nodes -owide
