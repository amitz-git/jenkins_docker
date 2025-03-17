pipeline {
    agent {
        docker { image 'jenkins/jenkins:lts' }
    }
    stages {
        stage('Pull Nginx Image') {
            steps {
                script {
                    sh 'docker pull nginx:latest'
                }
            }
        }
        stage('Run Nginx Container') {
            steps {
                script {
                    sh 'docker run -d --name my-nginx -p 8080:80 nginx:latest'
                }
            }
        }
    }
}
