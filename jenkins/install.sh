#Install VirtualBox:
sudo apt update -y
sudo apt-get install docker.io -y
vi /lib/systemd/system/docker.service
    ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock -H=tcp://0.0.0.0:2375
systemctl start docker
sudo usermod -aG docker $(whoami)
sudo apt install virtualbox -y
sudo apt-get install conntrack -y
#Install kubectl:
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
#Install Minikube:
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
minikube start --kubernetes-version=v1.21.0 --driver=none
mkdir -p /opt/jenkins_home
chown -R ubuntu:ubuntu /opt/jenkins_home
