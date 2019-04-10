sudo apt-get update
sudo apt-get install -y apt-transport-https
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -qy docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubeadm kubelet kubectl
sudo kubeadm join 192.168.0.71:6443 --token 01n01m.f6rr9pby1epwkyfw \
    --discovery-token-ca-cert-hash sha256:4bb5a6964adb3cf75d41a050cef073ba37ed4a3c572dfd1c655cc4bcfb25e263
