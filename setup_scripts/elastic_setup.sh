cd cluster
kubectl apply -f 1_k8s_global/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f 2_elasticsearch
kubectl apply -f 3_kibana
