sudo apt-get update
sudo apt-get install -y apt-transport-https
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -qy docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubeadm kubelet kubectl
sudo kubeadm join 192.168.0.124:6443 --token 4vbgxf.rt4m0182dd0zrzjg \
    --discovery-token-ca-cert-hash sha256:8d3cb1891b1177ee1da747d59f201b8aad66378fa75f59e672209855d4c484db
sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo kubeadm reset
sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*
sudo apt-get autoremove
sudo rm -rf ~/.kube
