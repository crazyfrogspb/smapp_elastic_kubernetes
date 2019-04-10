sudo apt-get update
sudo apt-get install -y apt-transport-https
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -qy docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubeadm kubelet kubectl
sudo kubeadm join 192.168.0.124:6443 --token 834y1y.9amv0vo23zb77vgw \
    --discovery-token-ca-cert-hash sha256:372b8460676051653d6e254d1ac176006f77badf6e6fcabc645abb54ef50e160
sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo kubeadm reset
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*
sudo apt-get autoremove
sudo rm -rf ~/.kube
