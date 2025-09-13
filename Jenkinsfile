pipeline {
    agent any

    environment {
        // Customize these
        CONFIG = readJSON file: './env-config.json'
        // AWS_REGION = CONFIG.aws_region
        // ECR_REPO = CONFIG.ecr_repo
        // CLUSTER_NAME = CONFIG.cluster_name
        // //AWS_REGION = "us-east-1"
        // //ECR_REPO   = "855455101288.dkr.ecr.us-east-1.amazonaws.com/devops"
        // IMAGE_TAG  = CONFIG.ecr_img_tag
    }

    stages {
        // stage('Build') {
        //     steps {
        //         echo "Installing dependencies & running tests..."
        //         sh '''
        //           #cd devops-task
        //           # Example: Node.js project
        //           npm install
        //           #npm test || echo "Tests failed or not present"
        //         '''
        //     }
        // }

        stage('Dockerize') {
            steps {
                echo "Building Docker image..."
                sh '''
                  #cd /home/ubuntu/devops-task/
                  docker build -t $CONFIG.ecr_repo:$CONFIG.ecr_img_tag .

                '''
            }
        }

        stage('Push to Registry') {
            steps {
                echo "Logging into ECR and pushing image..."
                sh '''
                  aws ecr get-login-password --region $CONFIG.aws_region | \
                  docker login --username AWS --password-stdin $CONFIG.ecr_repo
                  docker push $CONFIG.ecr_repo:$CONFIG.ecr_img_tag
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to AWS EKS..."
                sh '''                  
                  aws eks --region $AWS_REGION update-kubeconfig --name $CONFIG.cluster_name
                  kubectl apply -f deployment/logo-server.yaml
                  kubectl set image deployment/logo-server logo-server=$CONFIG.ecr_repo:$CONFIG.ecr_img_tag -n default
                  kubectl rollout status deployment/logo-server -n default
                '''
            }
        }
    }
}
