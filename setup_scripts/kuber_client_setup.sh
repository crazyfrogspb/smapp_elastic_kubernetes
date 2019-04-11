sudo apt-get update
sudo apt-get install -y apt-transport-https openjdk-11-jdk
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -qy docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubeadm kubelet kubectl
sudo mkdir /usr/share/elasticsearch/
sudo mkdir /usr/share/elasticsearch/data
sudo kubeadm join 192.168.0.124:6443 --token mxmz9j.uidpb68tvvnfjos9 \
    --discovery-token-ca-cert-hash sha256:f940b0987d5fb461468d4c83e783f446ce8dddd4e61edaa2a430310b8422f637
sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo kubeadm reset
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*
sudo apt-get autoremove
sudo rm -rf ~/.kube
