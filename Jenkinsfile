pipeline {
    agent any

    environment {
        // Customize these
        GCP_REGION    = "us-central1"
        GCP_PROJECT   = "playground-s-11-1f24307d"
        GCP_REPO      = "devops"              // Artifact Registry repo name
        IMAGE_NAME    = "logo-server"
        IMAGE_TAG     = "latest"
        IMAGE_URI     = "${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT}/${GCP_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stages {
        stage('Dockerize') {
            steps {
                echo "Building Docker image..."
                sh '''
                  docker build -t $IMAGE_URI .
                '''
            }
        }

        stage('Push to Registry') {
            steps {
                echo "Logging into GCP Artifact Registry and pushing image..."
                sh '''
                  # Authenticate Docker with Artifact Registry
                  gcloud auth configure-docker $GCP_REGION-docker.pkg.dev -q

                  # Push the image
                  docker push $IMAGE_URI
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to GKE..."
                sh '''
                  # Update kubeconfig to connect to GKE cluster
                  gcloud container clusters get-credentials devops-cluster --region $GCP_REGION --project $GCP_PROJECT

                  # Update deployment with new image
                  kubectl set image deployment/logo-server \
                    logo-server=$IMAGE_URI -n default

                  # Wait for rollout
                  kubectl rollout status deployment/logo-server -n default
                '''
            }
        }
    }
}
