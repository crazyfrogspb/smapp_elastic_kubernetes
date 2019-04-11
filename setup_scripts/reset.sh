sudo kubeadm reset
sudo rm -rf ~/.kube
sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F && sudo iptables -X
sudo rm -rf /var/lib/etcd/*
sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo ip link set cni0 down
sudo brctl delbr cni0
