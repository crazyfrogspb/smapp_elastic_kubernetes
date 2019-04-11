cd cluster
kubectl apply -f 1_k8s_global/
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f 2_elasticsearch
kubectl apply -f 3_kibana
kubectl apply -f 4_ingress/static-ip-svc.yaml
kubectl patch svc nginx-ingress-lb -n elastic-smapp -p '{"spec": {"type": "LoadBalancer", "externalIPs":["128.122.217.226"]}}'
kubectl apply -f 4_ingress/ingress-nginx-controller.yml
kubectl apply -f 4_ingress/nginx-ingress.yml
