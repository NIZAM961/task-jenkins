pipeline {
    agent any

    environment {
        APP_NAME = "microdegree"
        DEPLOY_ENV = "staging"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code from Git..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building ${microdegree}..."
                sh 'echo "Compiling source code..."'
                sh 'echo "Build successful!"'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo "Unit tests passed!"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to ${DEPLOY_ENV}..."
                sh 'echo "Deployment complete!"'
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Please check logs."
        }
    }
}

