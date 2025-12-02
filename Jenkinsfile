pipeline {
    agent any

    environment {
        EC2_USER = 'ubuntu'
        EC2_HOST = '3.237.180.117'
        DEPLOY_DIR = '~/deploy-repo'
        PEM_FILE = '/home/sambhav_singh/docker/docker-ec2-key.pem'
    }

    stages {
        stage('Deploy Docker Compose') {
            steps {
                sh """
                    ssh -i ${PEM_FILE} -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                        mkdir -p ${DEPLOY_DIR}
                        cd ${DEPLOY_DIR} || git clone https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git .
                        git pull
                        docker-compose down || true
                        docker-compose up -d --build
                    '
                """
            }
        }
    }
}

