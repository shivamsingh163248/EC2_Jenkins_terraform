pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/shivamsingh163248/EC2_Jenkins_terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh """
                        terraform plan \
                        -var 'aws_access_key=${AWS_ACCESS_KEY_ID}' \
                        -var 'aws_secret_key=${AWS_SECRET_ACCESS_KEY}' \
                        -out=tfplan
                    """
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Terraform apply failed.'
        }
    }
}
