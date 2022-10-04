pipeline {
    agent any
    tools {
        maven "MAVEN"
        jdk "JDK"
    }
//qdqwd
    stages {
        stage('Initialize'){
            steps{
                echo "PATH = ${M2_HOME}/bin:${PATH}"
                echo "M2_HOME = /opt/maven"
            }
        }
        stage('Build Maven') {
            steps {
            	//case direct path
                //dir("C:/Users/2521120036/git/DemoJenkinsPipelineDeployDocker") {
                //case generate by pipeline systax
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/2521120036/DemoJenkinsPipelineDeployDocker']]])
                bat 'mvn clean install'
            }
        }
        stage('Bulid Image'){
            steps {
                script{
                    bat 'docker build -t suphachoke/devops-integration .'
                }
            }
        }
        stage('Push Image to DockerHub'){
         	steps {
         		script {
  					withCredentials([string(credentialsId: 'dockerhub-PW', variable: 'dockerhubPW')]) {
    					bat 'docker login --username suphachoke --password %dockerhubPW%'
					}
					bat 'docker push suphachoke/devops-integration'
         		} 
        	}
   		}
   }
}
  