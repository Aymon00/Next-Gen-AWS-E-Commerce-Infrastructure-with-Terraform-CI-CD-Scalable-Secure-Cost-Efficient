## 🚀 CI/CD with Jenkins

This project includes an automated **CI/CD pipeline using Jenkins** to deploy the infrastructure with Terraform.  
The pipeline performs the following steps:

1️⃣ **Checkout Code**: Pulls the latest changes from GitHub.  
2️⃣ **Setup Terraform**: Installs Terraform and initializes the working directory.  
3️⃣ **Validate Terraform**: Checks formatting and validates the Terraform code.  
4️⃣ **Plan Terraform**: Runs `terraform plan` to preview the changes.  
5️⃣ **Apply Terraform**: If changes are approved, applies them automatically.  

The pipeline is triggered on **any new commit to the `main` branch**.  

## aws-ecommerce-infra/
- │── modules/
- │   ├── networking/
- │   │   ├── vpc.tf
- │   │   ├── subnets.tf
- │   │   ├── security-groups.tf
- │   │   ├── variables.tf
- │   │   ├── outputs.tf
- │   ├── compute/
- │   │   ├── ec2.tf
- │   │   ├── auto-scaling.tf
- │   │   ├── variables.tf
- │   │   ├── outputs.tf
- │   ├── database/
- │   │   ├── rds.tf
- │   │   ├── variables.tf
- │   │   ├── outputs.tf
- │   ├── storage/
- │   │   ├── s3.tf
- │   │   ├── variables.tf
- │   │   ├── outputs.tf
- │
- ├── main.tf
- ├── variables.tf
- ├── outputs.tf
- ├── terraform.tfvars
- ├── backend.tf
- ├── README.md
- ├── .gitignore

This project sets up a full AWS infrastructure for an E-Commerce platform, including:

- **Networking:** VPC, Public & Private Subnets, Security Groups
- **Compute:** EC2 Instances, Auto Scaling Group, Application Load Balancer
- **Storage:** S3 for static content
- **Database:** RDS (MySQL/PostgreSQL)
- **IAM:** Secure roles and policies
- **Monitoring:** CloudWatch for logs and metrics



aws-ecommerce-infra/
│── modules/
│   ├── networking/
│   │   - | Elastic-IP.tf
│   │   - | Internet-gateway.tf
│   │   - | Load-Balancer.tf
│   │   - | NAT-Gateway.tf
│   │   - | Route-Table.tf
│   │   - | SG.tf
│   │   - | subnets.tf
│   │   - | vpc.tf
│   ├── compute/
│   │   - | AS-Group.tf
│   │   - | ec2.tf
│   ├── database/
│   │   - | rds.tf
│   ├── storage/
│   │   - | s3.tf
│
│── - | .gitignore
│── - | Jenkinsfile
│── - | README.md
│── - | backend.tf
│── - | outputs.tf
│── - | variables.tf
│── - | providers.tf 
│── - | main.tf
