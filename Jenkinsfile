pipeline {
    agent any

    environment {
        TF_VAR_aws_access_key = credentials('aws-access-key-id')
        TF_VAR_aws_secret_key = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/shivamsingh163248/EC2_Jenkins_terraform.git'
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
                    sh 'terraform plan -out=tfplan'
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
        success {
            echo '✅ Terraform apply completed successfully.'
        }
        failure {
            echo '❌ Terraform apply failed.'
        }
    }
}
