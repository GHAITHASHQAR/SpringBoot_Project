pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/GHAITHASHQAR/SpringBoot_Project']]])
      }
    }

    stage('Build Application') {
      steps {
        // Build the Spring Boot application with Gradle
        bat 'gradle clean build'
      }
    }

    stage('Build Docker Image') {
      steps {
        // Build Docker image with ghayth name
        bat 'docker build -t ghayth .'
      }
    }

    stage('Push Docker Image') {
      steps {
        // Login to Docker Hub
        withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
          bat "docker login -u ghaith123 -p ${dockerhub}"
          bat 'docker tag ghayth ghaith123/ghayth'

          // Push the Docker image to Docker Hub
          bat 'docker push ghaith123/ghayth'
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        bat 'kubectl apply -f deployment.yaml'
        bat 'kubectl apply -f service.yaml'
        bat 'kubectl apply -f ingress.yaml'
      }
    }
  }
}
