# Terraform AWS Portfolio Infrastructure

This project showcases a production-grade AWS infrastructure built entirely with Terraform. It powers my personal portfolio site [shivdevops.cloud](https://shivdevops.cloud), and demonstrates modular infrastructure design, automation, and cloud-native best practices.

---

## 📐 Architecture Overview

![Architecture Diagram](docs/Architecture_diagram.png)

The infrastructure includes:

- VPC with public/private subnets
- NAT Gateway and Internet Gateway
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG) with Launch Template
- EC2 instances (public and private)
- Security Groups and Route Tables
- ACM for SSL termination
- Cloudflare DNS integration

---

## 📸 Screenshots

| Component        | Screenshot                          |
|------------------|-------------------------------------|
| VPC              | `docs/screenshots/VPC.png`          |
| Subnets          | `docs/screenshots/SUBNETS.png`      |
| NAT Gateway      | `docs/screenshots/NAT-GW.png`       |
| ALB              | `docs/screenshots/ALB.png`          |
| Target Group     | `docs/screenshots/Target_group.png` |
| ASG              | `docs/screenshots/ASG.png`          |
| Launch Template  | `docs/screenshots/Launch-Template.png` |
| EC2 Instance     | `docs/screenshots/Instance.png`     |
| ACM              | `docs/screenshots/Certificates.png` |
| Cloudflare DNS   | `docs/screenshots/Cloud_flare.png`  |

---

## 🚀 Live Demo

Visit: [shivdevops.cloud](https://shivdevops.cloud)

---

## 🛠️ Tech Stack

- Terraform (modular)
- AWS (EC2, ALB, ASG, VPC, ACM)
- Cloudflare DNS
- GitHub for version control

---

## 📂 Repo Structure

```
terraform-aws-portfolio-infrastructure/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── output.tf
│   ├── backend.tf
│   ├── terraform.tfvars.example
│   ├── README.md
│   └── modules/
│       ├── vpc/
│       ├── alb/
│       ├── asg/
│       ├── launch-template/
│       ├── ec2-public/
│       └── ec2-private/
├── docs/
│   ├── Architecture_diagram.png
│   └── screenshots/
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites
- Terraform >= 1.0
- AWS Account with appropriate IAM permissions
- AWS CLI configured

### Setup

1. Clone the repository:
```bash
git clone <repo-url>
cd terraform-aws-portfolio-infrastructure
```

2. Navigate to the terraform directory:
```bash
cd terraform
```

3. Create `terraform.tfvars` from the example:
```bash
cp terraform.tfvars.example terraform.tfvars
```

4. Update the variables with your AWS region and project details.

5. Initialize and deploy:
```bash
terraform init
terraform plan
terraform apply
```

---

## 💼 About Me

I'm a Cloud & DevOps Architect specializing in multi-cloud infrastructure, automation, and client-ready solutions. This repo is part of my freelance portfolio to showcase real-world deployments and reproducible infrastructure.
