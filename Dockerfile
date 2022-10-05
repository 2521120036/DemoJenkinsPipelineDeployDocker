#FROM [--platform=<platform>] <image> [AS <name>]
#call base image for environment self project
FROM openjdk:8 
#config port for docker 
EXPOSE 8080
#ADD <src> <dest> 
#add file to folder
ADD target/devops-integration.jar devops-integration.jar
#compile
ENTRYPOINT ["java","-jar","/devops-integration.jar"]

#test just commit