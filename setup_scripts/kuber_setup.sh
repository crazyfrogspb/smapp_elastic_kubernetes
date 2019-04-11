sudo apt-get update
sudo apt-get install -y apt-transport-https openjdk-11-jdk
curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -qy docker-ce
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo mkdir /usr/share/elasticsearch/
sudo mkdir /usr/share/elasticsearch/data
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm kubelet kubectl
IP="$(ifconfig | grep -A 1 'ens3' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -1)"
sudo kubeadm init --apiserver-advertise-address=$IP --pod-network-cidr=192.168.0.0/16
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl -n kube-system apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
kubectl taint nodes smapp-elastic-1 node-role.kubernetes.io/master-
sudo systemctl daemon-reload
sudo systemctl restart kubelet
