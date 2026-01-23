# Terraform Infrastructure Modules

This folder contains modular Terraform code used to deploy a production-grade AWS infrastructure for my portfolio site.

---

## 📦 Modules Included

| Module           | Purpose                            |
|------------------|-------------------------------------|
| `vpc`            | Creates VPC, subnets, route tables |
| `alb`            | Sets up Application Load Balancer |
| `asg`            | Configures Auto Scaling Group      |
| `launch-template`| Defines EC2 launch configuration   |
| `ec2-public`     | Deploys public EC2 instance        |
| `ec2-private`    | Deploys private EC2 instance       |

Each module includes:

- `main.tf` — resource definitions  
- `variables.tf` — input parameters  
- `outputs.tf` — exported values

---

## 🔧 How to Use

1. Clone the repo  
2. Navigate to `terraform/`  
3. Create your own `terraform.tfvars` based on the example:

```hcl
aws_region = "ap-south-1"
project    = "shiv-portfolio"
environment = "dev"
```

4. Initialize and apply:

```bash
terraform init
terraform plan
terraform apply
```

📁 **Folder Structure**

```
terraform/
├── main.tf
├── variables.tf
├── output.tf
├── backend.tf
├── terraform.tfvars.example
├── README.md
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── alb/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── asg/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── launch-template/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2-public/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── ec2-private/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---