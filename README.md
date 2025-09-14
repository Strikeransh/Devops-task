<h1>DevOps EKS Deployment Project </h1>
This project demonstrates deploying a containerized Logo Server application to Amazon EKS (Elastic Kubernetes Service) using AWS Fargate for serverless pod execution.
The application is exposed externally using a Kubernetes LoadBalancer Service backed by an AWS ELB.

<h1>Project Overview</h1>

<b>Cluster: Amazon EKS (devops-cluster)</ul>

<ul>Compute: AWS Fargate profile (devops-fargate)</ul>

<ul>Namespace: default</ul>

<ul>Application: logo-server (Docker image hosted in Amazon ECR)</ul>

<ul>Service: LoadBalancer service for external access</ul>

<h1>ENV Setup:</h1>
<b>Configure and install Below tools:</b>
<ul>Java</ul>
<ul>Jenkins</ul>
<ul>Docker</ul>
<ul>Kubernetes</ul>
<ul>AWS-CLI</ul>
<ul>Github webhook</ul>

<H1>Steps to Configure</H1>
<H2>Step 1.</h2> <h4>Create a ECR repository and update the repository link in jenkins file<br></h4>
<h2>Step 2.</h2><h4> Create the EKS cluster and attache the default roles.<br></h4>
<h2>Step 3.</h2><h4>  Assign the Iam role to jenkins server to access the AWS service or use Iam user.<br></h4>
<h2>Step 4.</h2><h4>  Configure the nodes for EKS cluster. (we are using AWS fargate)<br></h4>
<h2>Step 5.</h2><h4>  Install above mentioned tools on AWS EC2 server. ( use setup.bat file for all required tool installation).<br></h4>
<h2>Step 6.</h2><h4>  Configure the jenkins tools.<br></h4>
<h2>Step 7.</h2><h4>  Install below plugin on jenkins<br></h4>
  <ul>a. Github Plugins</ul><br>
  <ul>b. Github Integration Plugins</ul><br>
  <ul>c. Pipeline</ul><br>
<h2>Step 8.</h2><h4>  Create the pipeline (Refer to the Jenkins Pipeline Configure Images)<br></h4>
<h2>Step 9.</h2><h4>  Configure the webhook on Github Repo for jenkins server (Refer to the Github Webhook image)<br></h4>
<h2>Step 10.</h2><h4>  Now Build the pipeline from jenkins server.<br>
<h2>Step 11.</h2><h4>  Go to the build number and check the console output on jenkins dashboard.<br></h4>
<h2>Step 12.</h2><h4>  Go to the EKS console and check for pods and nodes deployment.<br></h4>
<h2>Step 13.</h2><h4>  Go to the jenkins server and check for podes details<br></h4>
 kubectl get pods<br>
<h2>Step 14.</h2><h4>  Use below command to get the endpoint for our cluster (Refer to the Kubectl endpoint image)<br></h4>
  kubectl get endpoints logo-server-service -n default<br></h4>
<h2>Step 15.</h2><h4>  Open the endpoint in the browser. (we have window server in same VPC, Refer to the Application Images)<br></h4>
