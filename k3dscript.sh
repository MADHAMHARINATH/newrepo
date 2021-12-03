echo "updating repository"
sudo apt update
echo "installing docker"
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt install docker-ce -y
echo "checking docker version"
sudo docker --version
sleep 5
echo "Downloading the kubectl latest release with this command"
sudo curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl
echo "Installing kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "Check the version"
sudo kubectl version --client
sleep 5
echo "install rancher/k3d using curl"
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0 bash
echo "installed k3d"
sleep 5
echo "Creating Multi-Server Clusters"
sudo k3d cluster create multinode --agents 2 --servers 1
sleep 5
echo "Showing the nodes which we have created"
sudo kubectl get nodes -owide
