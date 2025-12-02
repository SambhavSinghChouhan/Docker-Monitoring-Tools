pipeline {
    agent any

    environment {
        EC2_USER = 'ubuntu'                        // EC2 user
        EC2_HOST = '3.237.180.117'                // EC2 public IP
        PEM_FILE = '/var/lib/jenkins/docker-ec2-key.pem' // Path to PEM file inside Jenkins
        DEPLOY_DIR = '~/deploy-repo'               // Deployment directory on EC2
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

        stage('Deploy Docker Compose') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -i ${PEM_FILE} -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            # Remove old repo and clone fresh
                            rm -rf ${DEPLOY_DIR}
                            git clone https://github.com/SambhavSinghChouhan/Docker-Monitoring-Tools.git ${DEPLOY_DIR}

                            # Move into deployment folder
                            cd ${DEPLOY_DIR}

                            # Stop old containers if any, then rebuild and run
                            docker-compose down || true
                            docker-compose up -d --build
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

