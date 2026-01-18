pipeline {
    agent any

    stages {

        stage('Check Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Spring Boot') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t user-management-backend-app .'
            }
        }
    }
}
