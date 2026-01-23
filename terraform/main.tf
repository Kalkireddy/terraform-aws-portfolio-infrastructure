locals {
  user_data = <<EOF
#!/bin/bash
apt update -y
apt install -y apache2
systemctl start apache2
systemctl enable apache2

cat << 'HTML' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DevopsWithShiv | Cloud & DevOps Architect</title>
<style>
body { margin: 0; font-family: Arial, sans-serif; background: #0d1117; color: #e6edf3; }
header { padding: 60px 20px; text-align: center; background: linear-gradient(135deg, #1f6feb, #238636); }
header h1 { font-size: 48px; margin: 0; color: white; }
header p { font-size: 20px; margin-top: 10px; color: #d0d7de; }
.section { padding: 60px 20px; max-width: 900px; margin: auto; }
h2 { color: #58a6ff; border-bottom: 2px solid #30363d; padding-bottom: 10px; }
.services ul { list-style: none; padding: 0; }
.services li { background: #161b22; padding: 15px; margin: 10px 0; border-radius: 6px; border: 1px solid #30363d; }
.contact a { color: #58a6ff; text-decoration: none; font-weight: bold; }
footer { text-align: center; padding: 20px; background: #161b22; border-top: 1px solid #30363d; margin-top: 40px; }
</style>
</head>
<body>

<header>
<h1>DevopsWithShiv</h1>
<p>Cloud & DevOps Architect | AWS, Azure, Kubernetes, Terraform, Jenkins, Docker, Helm, GitHub Actions, Production‑Grade CI/CD</p>
</header>

<section class="section about">
<h2>About Me</h2>
<p>
I'm Shiv, a Cloud & DevOps Architect specializing in designing, automating, and scaling modern cloud infrastructure across AWS and Azure.
I build production‑grade systems using Kubernetes, Docker, Terraform, Jenkins, Helm, and GitHub Actions — enabling teams to ship faster, safer, and with complete automation.
</p>
<p>
My work spans end‑to‑end DevOps: infrastructure design, CI/CD pipelines, container orchestration, monitoring, cost optimization, and cloud migrations.
I focus on reliability, automation, and clean architecture so businesses can grow without worrying about their infrastructure.
</p>
</section>

<section class="section services">
<h2>What I Do</h2>
<ul>
<li>✔ Cloud Architecture (AWS & Azure)</li>
<li>✔ Kubernetes Cluster Setup & Application Deployment</li>
<li>✔ Terraform Infrastructure Automation</li>
<li>✔ Jenkins & GitHub Actions CI/CD Pipelines</li>
<li>✔ Docker Containerization & Helm Packaging</li>
<li>✔ Load Balancing, Auto Scaling & High Availability</li>
<li>✔ Monitoring & Logging (Prometheus, Grafana, CloudWatch)</li>
<li>✔ Cost Optimization & Cloud Security Best Practices</li>
</ul>
</section>

<section class="section contact">
<h2>Contact</h2>
<p>Email: <a href="mailto:devopswithshiv@gmail.com">devopswithshiv@gmail.com</a></p>
<p>Location: Hyderabad, India</p>
<p>Availability: Freelance / Remote</p>
</section>

<footer>© 2026 DevopsWithShiv — All Rights Reserved</footer>

</body>
</html>

HTML
EOF
}





# PROVIDER CONFIGURATION

provider "aws" {
  region = "ap-south-1"
}

# VPC MODULE

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]

  tags = var.tags
}





#ALB MODULE

module "alb" {
  source              = "./modules/alb"
  name                = "shiv"
  acm_certificate_arn = var.acm_certificate_arn
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  tags                = var.tags
}

# LAUNCH TEMPLATE MODULE

module "launch_template" {
  source        = "./modules/launch-template"
  name          = "shiv"
  vpc_id        = module.vpc.vpc_id
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = local.user_data
  tags          = var.tags
}


# AUTO SCALING GROUP MODULE


module "asg" {
  source             = "./modules/asg"
  name               = "shiv"
  launch_template_id = module.launch_template.launch_template_id
  target_group_arn   = module.alb.target_group_arn
  private_subnets    = module.vpc.private_subnets
  min_size           = 1
  max_size           = 3
  desired_capacity   = 1

}