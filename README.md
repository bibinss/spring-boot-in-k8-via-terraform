This is a sample spring boot application with terraform scripts to deploy the app in Kubernetes (minikube).
App is dockerized and the image is published to docker hub

Terraform scripts are kept at **/deployment/terraform** folder

**How to deploy the app in kubernetes**

1. Install [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) on your machine
2. Install [Terraform](https://www.terraform.io/downloads.html)
3. Run below commands
    * cd deployment/terraform
    * terraform init
    * terraform plan
    * terraform apply
    * minikube service $(terraform output lb_ip)
4. You should see the app deployed in kubernetes
