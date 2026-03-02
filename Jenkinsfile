pipeline {
    agent any

    tools {
        maven 'maven-3.9'   // name of Maven installation in Jenkins
    }

    environment {
        IMAGE = "hamza5839/jenkins-pipeline"
        TAG = "2.1"
    }

    stages {

        stage('Build JAR') {
            steps {
                echo "Building the application..."
                sh 'mvn package'  // packages your Java app into a jar/war
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t $IMAGE:$TAG ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: '79e1e90f-4fd1-4c20-9216-309856f9d920',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    echo "Logging in and pushing to DockerHub..."
                    sh 'echo "$PASS" | docker login -u "$USER" --password-stdin'
                    sh "docker push $IMAGE:$TAG"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Running deployment commands..."
                sh 'echo "Deploy step here"'  // replace with real deploy commands
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
