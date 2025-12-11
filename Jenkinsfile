pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/home/ubuntu/deploy-repo'
    }

    stages {
        stage('Prepare') {
            steps {
                sh '''
                  set -euo pipefail
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
                sh """
                  set -euo pipefail
                  rm -rf ${DEPLOY_DIR}
                  git clone https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git ${DEPLOY_DIR}
                  cd ${DEPLOY_DIR}
                  # use docker compose (v2)
                  docker compose down || true
                  docker compose up -d --build
                  docker ps -a
                """
            }
        }
    }

    post {
        success { echo 'Deployment completed successfully!' }
        failure { echo 'Deployment failed! Check Jenkins logs.' }
    }
}
