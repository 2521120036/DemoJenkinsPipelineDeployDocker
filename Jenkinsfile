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
                //dir("C:/Users/2521120036/git/DemoJenkinsPipelineDeployDocker") {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/2521120036/DemoJenkinsPipelineDeployDocker']]])
                bat 'mvn clean install'
            }
        }
   }
}
  