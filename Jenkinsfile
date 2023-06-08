pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/arunpateldaynilgroup/Spring-Boot-Hello-Api_WIth-Jenkins-Pipeline-Dockerfile.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    def currentDate = sh(returnStdout: true, script: 'date +%d-%m-%Y').trim()
                    sh "docker build -t arunpateldaynil/spring-boot-hello-api_with-jenkins-pipeline-dockerfile:${currentDate} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'Docker-Hub-Password', variable: 'dockerpwd')]) {
                    sh 'docker login -u arunpateldaynil -p $dockerpwd'
                    script {
                        def currentDate = sh(returnStdout: true, script: 'date +%d-%m-%Y').trim()
                        sh "docker push arunpateldaynil/spring-boot-hello-api_with-jenkins-pipeline-dockerfile:${currentDate}"
                    }
                }
            }
        }
    }
}
