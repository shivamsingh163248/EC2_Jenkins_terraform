pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')      // Jenkins secret text ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')  // Jenkins secret text ID
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
