aws-ecommerce-infra/
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
