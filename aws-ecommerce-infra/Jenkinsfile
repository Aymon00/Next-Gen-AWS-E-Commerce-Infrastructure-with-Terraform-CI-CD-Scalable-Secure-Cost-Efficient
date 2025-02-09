pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        TF_VERSION = '1.6.0'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Aymon00/Next-Gen-AWS-E-Commerce-Infrastructure-with-Terraform-CI-CD-Scalable-Secure-Cost-Efficient.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }

        stage('Validate Terraform') {
            steps {
                sh 'terraform fmt -check'
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            when {
                branch 'main'
            }
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
    
    post {
        success {
            echo 'Terraform deployment completed successfully!'
        }
        failure {
            echo 'Terraform deployment failed. Please check the logs.'
        }
    }
}
