pipeline {
    agent any

    environment {
        DEPLOY_DIR = '/home/ubuntu/deploy-repo'
    }

    stages {
        stage('Deploy') {
            steps {
                sh """
                    rm -rf ${DEPLOY_DIR}
                    git clone https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git ${DEPLOY_DIR}
                    cd ${DEPLOY_DIR}
                    docker-compose down || true
                    docker-compose up -d --build
                    docker ps
                """
            }
        }
    }

    post {
        success { echo 'Deployment completed successfully!' }
        failure { echo 'Deployment failed! Check Jenkins logs.' }
    }
}
