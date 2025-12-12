pipeline {
    agent any

    environment {
        WORKSPACE_DIR = "${env.WORKSPACE}"
    }

    stages {
        stage('Prepare') {
            steps {
                sh '''#!/bin/bash
                  set -e
                  set -u
                  set -o pipefail

                  echo "Job executed on: $(hostname)"
                  echo "User: $(whoami)"
                  echo "Docker version:"
                  docker --version || true
                  echo "Docker compose version:"
                  docker compose version || echo "docker compose not found"
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''#!/bin/bash
                  set -e
                  set -u
                  set -o pipefail

                  cd "${WORKSPACE_DIR}"

                  echo "Stopping old containers..."
                  docker compose down || true

                  echo "Starting new containers..."
                  docker compose up -d --build

                  echo "Containers running:"
                  docker ps -a
                '''
            }
        }
    }

    post {
        success { echo 'Deployment completed successfully!' }
        failure { echo 'Deployment failed! Check Jenkins logs.' }
    }
}
