pipeline {
    agent any

    tools {
        maven 'maven-3.9'
    }

    environment {
        IMAGE = "devhamzaops/java-maven-app"
        TAG = "1.1"
    }

    stages {
        stage('Build Jar') {
            steps {
                echo "Building the application jar"
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image"
                sh "docker build -t $IMAGE:$TAG ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '79e1e90f-4fd1-4c20-9216-309856f9d920', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo "$PASS" | docker login -u "$USER" --password-stdin
                    docker push $IMAGE:$TAG
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy step placeholder"
            }
        }
    }
}
