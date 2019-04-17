#!bin/bash

#THIS SHELL FILE INSTALL PROMETHEUS AND GRAFANA FOR AN EXISTING GKE CLUSTER


echo "-------------------- STARTING OPERATION --------------------"


#creating cluster clusterrolebinding for prometheus extra priveleges
echo "Enter e-mail linked to the GCP Account:"
read email
kubectl create clusterrolebinding admin-cluster-binding --clusterrole=cluster-admin --user=$email



#applying the yaml file
kubectl apply \
  --filename https://raw.githubusercontent.com/rathoremayank/prometheus-grafana-k8s/master/manifests-all.yaml

echo "..."
echo "..."
echo "WAITING FOE THE PODS TO COME LIVE..."
    
sleep 15s

echo "PODS ALIVE..."


#viewing available pods
kubectl get pods -n monitoring


echo "-------------------- FORWARDING PORT TO ACCESS GRAFANA DASHBOARD --------------------"

#forwarding port to access grafana on browser
export POD_NAME=$(kubectl get pods --namespace monitoring -l "app=grafana,component=core" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace monitoring $POD_NAME 3000:3000


