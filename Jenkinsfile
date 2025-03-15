pipeline {
    agent { lebel 'docker' }  // Runs on any available Jenkins node

    environment {
        IMAGE_NAME = 'my-app'  // Name of the Docker image
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/amitz-git/jenkins_docker.git'  // Clone your repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "echo ${env.DOCKER_PASSWORD} | docker login --username ${env.DOCKER_USER} --password-stdin"
                    sh "docker tag $IMAGE_NAME:$IMAGE_TAG ${env.DOCKER_USER}/$IMAGE_NAME:$IMAGE_TAG"
                    sh "docker push ${env.DOCKER_USER}/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker run -d -p 8080:80 --name my-app-container $IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }
    }
}
