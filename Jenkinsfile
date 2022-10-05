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
                withCredentials([string(credentialsId: 'IDgit-name', variable: 'git-name')]) {
    				checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: '%git-name%']]])
				}
                bat 'mvn clean install'
            }
        }
        stage('Bulid Image'){
            steps {
                script{
                	withCredentials([string(credentialsId: 'IDrepo-name', variable: 'repo-name')]) {
                		bat 'docker build -t %repo-name% .'
                	}
                }
            }
        }
        stage('Push Image to DockerHub'){
         	steps {
         		script {
  					withCredentials([string(credentialsId: 'dockerhub-PW', variable: 'dockerhubPW')]) {
    					bat 'docker login --username suphachoke --password %dockerhubPW%'
					}
					withCredentials([string(credentialsId: 'IDrepo-name', variable: 'repo-name')]) {
						bat 'docker push %repo-name%'
					}
         		} 
        	}
   		}
   }
}
  