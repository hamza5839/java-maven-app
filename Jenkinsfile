pipeline {
    agent any
    toosl {
        maven = 'maven-3.9'
    }
    stages {
        stage ('build jar') {
            steps {
                script {
                echo "building the application"
                sh 'mvn package'
                    }
                 }
            }
        stage ('build image') {
                    steps {
                        script {
                        echo "building the docker image"
                        withCredentials([usernamePassword(credentialsId: '79e1e90f-4fd1-4c20-9216-309856f9d920', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                         sh 'docker build -t hamza5839/jenkins-pipeline:2.1 .'
                         sh "echo $PASS | docker login -u $USER --password-stdin"
                         sh 'docker push hamza5839/jenkins-pipeline:2.1'
                        }
                        sh 'docker build '
                            }
                         }
                    }
            stage ('deploy') {
                steps {
                    script{
                 sh 'echo running shell command'
                 }
               }
             }
           }
        }
