pipeline {
    agent {
        label 'docker' // Ensures this runs only on the designated Docker node
    }

    environment {
        IMAGE_NAME = 'nginx:latest'
        CONTAINER_NAME = 'nginx-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --name $CONTAINER_NAME $IMAGE_NAME"
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    sh "docker exec $CONTAINER_NAME ./run-tests.sh"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    sh "docker stop $CONTAINER_NAME || true"
                    sh "docker rm $CONTAINER_NAME || true"
                    sh "docker rmi $IMAGE_NAME || true"
                }
            }
        }
    }
}
