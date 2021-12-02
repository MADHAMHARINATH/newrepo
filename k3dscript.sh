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
sudo curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl
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
sleep 5
echo "Creating Multi-Server Clusters"
sudo k3d cluster create multinode --agents 2 --servers 1
sleep 5
echo "Showing the nodes which we have created"
sudo kubectl get nodes -owide
