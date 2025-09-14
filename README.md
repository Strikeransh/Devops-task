<h1>DevOps EKS Deployment Project </h1>
This project demonstrates deploying a containerized Logo Server application to Amazon EKS (Elastic Kubernetes Service) using AWS Fargate for serverless pod execution.
The application is exposed externally using a Kubernetes LoadBalancer Service backed by an AWS ELB.

<h1>Project Overview</h1>

<b>Cluster: Amazon EKS (devops-cluster)

Compute: AWS Fargate profile (devops-fargate)

Namespace: default

Application: logo-server (Docker image hosted in Amazon ECR)

Service: LoadBalancer service for external access</b>

<h1>ENV Setup:</h1>
<b>Configure and install Below tools:</b>
Java
Jenkins
Docker
Kubernetes
AWS-CLI
Github webhook

<H1>Prequisite</H1>
Step 1. Create a ECR repository and update the repository link in jenkins file
Step 2. Create the EKS cluster and attache the default roles.
Step 3. Assign the Iam role to jenkins server to access the AWS service or use Iam user.
Step 4. Configure the nodes for EKS cluster. (we are using AWS fargate)
Step 5: Install abovementioned tools on AWS EC2 server. ( use script.bat file for all required installation).
Step 6: Configure the jenkins tools.
Step 7. Install below plugin on jenkins
  a. Github Plugins
  b. Github Integration Plugins
  c. Pipeline
Step 8: Create the pipeline (Refer to the Jenkins Pipeline Configure Images)
Step 9: Configure the webhook on Github Repo for jenkins server (Refer to the Github Webhook image)
Step 10: Now Build the pipeline from jenkins server.
Step 11: Go to the build number and check the console output on jenkins dashboard.
Step 12: Go to the EKS console and check for pods and nodes deployment.
Step 13: Go to the jenkins server and check for podes details
 kubectl get pods
Step 14: Use below command to get the endpoint for our cluster (Refer to the Kubectl endpoint image)
  kubectl get endpoints logo-server-service -n default
Step 15: Open the endpoint in the pbrowser. (we have window server in same VPC, Refer to the Application Images)
