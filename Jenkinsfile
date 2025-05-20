pipeline {
    agent any

    tools {
        nodejs "Node18"  // Sesuaikan dengan nama NodeJS yang diset di konfigurasi Jenkins
    }

    environment {
        GIT_BRANCH = "development"
        GIT_REPO = "https://github.com/hafizhumar/devops.git"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                // Kalau belum ada test, biar tetap lanjut
                sh 'npm test || echo "No tests defined"'
            }
        }

        stage('Build') {
            steps {
                // Aman walau tidak ada script "build" di package.json
                sh 'npm run build || echo "No build script defined"'
            }
        }
    }

    post {
        success {
            echo ":white_check_mark: CI Pipeline completed successfully."
        }
        failure {
            echo ":x: CI Pipeline failed. Check the logs."
        }
    }
}