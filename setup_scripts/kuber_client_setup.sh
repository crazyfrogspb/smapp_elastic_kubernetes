sudo apt-get update
sudo apt-get install -y apt-transport-https
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -qy docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubeadm kubelet kubectl
sudo kubeadm join 192.168.0.71:6443 --token l5iifg.1v5eyryxlxu8heo7 \
    --discovery-token-ca-cert-hash sha256:e27c10c9abb0ffc25d960c0aa6d5f34942ae566897ba2c42d4797895e5ecbeac
