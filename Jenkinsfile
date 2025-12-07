pipeline {
    agent any

    environment {
        EC2_USER = 'ubuntu'
        EC2_HOST = '23.23.162.184'
        PEM_FILE = '/var/lib/jenkins/docker-ec2-key.pem'
        DEPLOY_DIR = '~/deploy-repo'
    }

    stages {

        stage('Checkout Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git',
                    credentialsId: 'github-path-local'
            }
        }

        stage('Test SSH Connection') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -i ${PEM_FILE} -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} 'echo SSH OK'
                    """
                }
            }
        }

        stage('Install Docker & Docker Compose on EC2') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -i ${PEM_FILE} -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            echo "=== Installing Docker ==="
                            sudo apt-get update -y
                            sudo apt-get install -y docker.io
                            sudo usermod -aG docker ubuntu

                            echo "=== Installing Docker Compose ==="
                            sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" \\
                                -o /usr/local/bin/docker-compose
                            sudo chmod +x /usr/local/bin/docker-compose

                            echo "=== Docker Versions ==="
                            docker --version
                            docker-compose --version
                        '
                    """
                }
            }
        }

        stage('Deploy Docker Compose') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -i ${PEM_FILE} -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            
                            echo "=== Cleaning old deployment ==="
                            rm -rf ${DEPLOY_DIR}

                            echo "=== Cloning fresh repo ==="
                            git clone https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git ${DEPLOY_DIR}

                            cd ${DEPLOY_DIR}

                            echo "=== Stopping old containers ==="
                            docker-compose down || true

                            echo "=== Starting all containers ==="
                            docker-compose up -d --build

                            echo "=== Running Containers ==="
                            docker ps
                        '
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed! Check Jenkins logs for details.'
        }
    }
}
