#!/bin/bash

WORK_DIR=$(pwd)

# Start/Create Kubernetes Cluster
# minikube start

# Set minikube context
# kubectl config use-context minikube

# Get Cluster IP
# kubectl get services

# Add/Delete Kubernetes Cluster Custom Route (CIDR clsuter network)
# sudo route -n add 10.96.0.0/16 192.168.99.100
# sudo route -n delete 10.96.0.0/16 192.168.99.100

# Use Minikube Docker Daemon
# eval $(minikube docker-env)

# Build Openmpi Docker Image
# docker build . -t tsimchev/openmpi:latest

# Generate SSH Key
# ssh-keygen -f ${WORK_DIR}/id_rsa -C '' -N '' -t rsa

# Create Kubernetes Secret
# kubectl create secret generic openmpi-id-rsa --from-file=id_rsa=${WORK_DIR}/id_rsa --from-file=id_rsa.pub=${WORK_DIR}/id_rsa.pub

# Delete Kubernetes Secret
# kubectl delete secret generic openmpi-id-rsa

# Create Deployment and Service
# kubectl create -f ./openmpi.yml

# Destroy Deployment and Service
# kubectl delete -f ./openmpi.yml

# Describe Pod
# kubectl describe pod openmpi-node-68cb79474f-gkh75

# Navigate to container
# kubectl exec -it openmpi-node-68cb79474f-hjw72 -- /bin/bash

# Generate SSH key
# ssh-keygen -f /etc/ssh/id_rsa -C '' -N '' -t rsa

# Build locally
# docker build openmpi-base -t tsimchev/openmpi-base:latest
# docker build openmpi-cluster -t tsimchev/openmpi-cluster:latest
# docker build openmpi-cluster-app -t tsimchev/openmpi-cluster-app:latest

# Build GKE
# gcloud config set project massive-sandbox-235519
# gcloud builds submit --timeout=2h --tag gcr.io/massive-sandbox-235519/openmpi-base ~/Desktop/openmpi/tmp/openmpi-base
# gcloud builds submit --timeout=2h --tag gcr.io/massive-sandbox-235519/openmpi-cluster ~/Desktop/openmpi/tmp/openmpi-cluster

# Run Intel MPI Bench Marks
# for BM in $(ls -1 ~/mpi-benchmarks/ | grep IMB-)
# do
#     mpirun --hostfile ~/mpi.hosts -n 3 ~/mpi-benchmarks/${BM} | tee ${BM}.log
# done