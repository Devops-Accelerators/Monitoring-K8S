#!bin/bash

#THIS SHELL FILE REMOVES THE INSTALLATION ON PROMETHEUS AND GRAFANA ON THE GKE CLUSTER BY DELETING THE NAMESPACE


echo "DELETING NAMESPACE..."

#deleting the namespace
kubectl delete namespace monitoring

#deleting cluster-role-binding
kubectl delete clusterrolebinding admin-cluster-binding
