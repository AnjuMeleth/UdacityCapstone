# Udacity Capstone Project
Kubernetes cluster is created using the following CloudFormation scripts :
./create.sh Infra genericinfra.yml genericinfra-params.json : Creates the generic Infra
./create.sh Cluster eks.yml eks-params.yml : Creates the Cluster
./create.sh Node node.yml node-params.yml : Creates the worker nodes for the cluster

Jenkinsfile is written to build a docker image , upload to Docker Hub and upload the Docker to the Kubernetes cluster
