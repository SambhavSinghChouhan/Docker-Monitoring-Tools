pipeline {
    agent any

    environment {
        EC2_USER = 'jenkinsdeploy'
        EC2_HOST = '3.237.180.117'
        DEPLOY_DIR = '~/deploy-repo'
    }

    stages {
        stage('Test SSH Connection') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh "ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} 'echo SSH OK'"
                }
            }
        }

        stage('Deploy Docker Compose') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            # create directory if not exists
                            mkdir -p ${DEPLOY_DIR}
                        '

                        # copy repo to EC2
                        rsync -avz -e "ssh -o StrictHostKeyChecking=no" ./ ${EC2_USER}@${EC2_HOST}:${DEPLOY_DIR}/

                        # run docker-compose on EC2
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            cd ${DEPLOY_DIR}
                            docker-compose down || true
                            docker-compose up -d --build
                        '
                    """
                }
            }
        }
    }
}

