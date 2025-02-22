## 🚀 CI/CD with Jenkins

This project includes an automated **CI/CD pipeline using Jenkins** to deploy the infrastructure with Terraform.  
The pipeline performs the following steps:

1️⃣ **Checkout Code**: Pulls the latest changes from GitHub.  
2️⃣ **Setup Terraform**: Installs Terraform and initializes the working directory.  
3️⃣ **Validate Terraform**: Checks formatting and validates the Terraform code.  
4️⃣ **Plan Terraform**: Runs `terraform plan` to preview the changes.  
5️⃣ **Apply Terraform**: If changes are approved, applies them automatically.  

The pipeline is triggered on **any new commit to the `main` branch**.  

aws-ecommerce-infra/
- │── modules/          # Contains all core infrastructure modules
- │   ├── networking/   # Networking: VPC, Subnets, SG, Route Tables, NAT, IGW
- │   ├── compute/      # Compute: EC2, Auto Scaling Group
- │   ├── database/     # Database: RDS (MySQL/PostgreSQL)
- │   ├── storage/      # Storage: S3 Bucket

- │── main.tf           # Calls all modules
- │── providers.tf      # Cloud provider (AWS)
- │── variables.tf      # Terraform variables
- │── outputs.tf        # Outputs
- │── backend.tf        # Backend configuration for Terraform State
- │── Jenkinsfile       # CI/CD with Jenkins
- │── .gitignore        # Ignore unnecessary files
- │── README.md         # Project documentation

This project sets up a full AWS infrastructure for an E-Commerce platform, including:

- **Networking:** VPC, Public & Private Subnets, Security Groups
- **Compute:** EC2 Instances, Auto Scaling Group, Application Load Balancer
- **Storage:** S3 for static content
- **Database:** RDS (MySQL/PostgreSQL)
- **IAM:** Secure roles and policies
- **Monitoring:** CloudWatch for logs and metrics


