# Deploy Your Flask App to AWS Elastic Beanstalk in 10 Minutes!

Welcome to the fastest way to deploy your Flask app to AWS Elastic Beanstalk! This repository is designed to help developers like you get up and running with minimal setup and maximum automation. No unnecessary complexity, just results.

The main goal is to allow you to focus on building your business logic while this repository takes care of the infrastructure and continuous deployment for you. Sit back and relax!


---

## 🚀 Features
- **Terraform-powered Deployment**: All infrastructure is handled by Terraform. Just tweak a couple of variables, and you’re good to go.
- **GitHub Actions Integration**: Deploy directly from your repository.
- **Simplified Configuration**: Default settings for development environment included.
- **Focus on Business Logic**: Spend your time building great applications—this code takes care of the infrastructure for you.

---

## 🛠 Prerequisites
Before you begin, make sure you have:
1. **AWS Account**: Access to an AWS account to set up your infrastructure.
2. **IAM User**: Create an IAM user with the following policy:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:*",
                "cloudformation:*",
                "cloudwatch:*",
                "s3:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "iam:PassRole",
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:GetRole",
                "iam:AttachRolePolicy",
                "iam:DetachRolePolicy",
                "iam:PutRolePolicy",
                "iam:ListRolePolicies",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:DeleteRolePolicy",
                "iam:ListInstanceProfiles",
                "iam:GetInstanceProfile",
                "iam:AddRoleToInstanceProfile",
                "iam:RemoveRoleFromInstanceProfile",
                "iam:CreateInstanceProfile",
                "iam:DeleteInstanceProfile"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "elasticbeanstalk.amazonaws.com"
                }
            }
        }
    ]
}
```

3. **S3 Bucket**: Create an S3 bucket for Terraform state management. Make sure it’s in the same region as your deployment. You could name it `beanstalkterraformstate` for starters(This is the name used in the [terraform backend](./terraform/backend.tf))

---

## 📂 Repository Structure
- `terraform/` - Contains all Terraform configuration files.
  - **`development.tfvars`**: Preconfigured for a development environment. Adjust as needed.
- `.github/workflows/` - Github workflows to manage deployment of flask app to AWS Elastic Beanstalk.
  - **`deploy-infrastructure.yml`**: It is triggered when changes are pushed to main. The workflow is responsible for creating and deploying the flask app to beanstalk
  - **`destory-infrastructure.yml`**: This workflow can only be triggered manually when you'd like to destroy the elastic beanstalk environment. Please use it with caution!
- `docker/` - Contains run scripts and configuration for nginx and gunicorn

---

## ⚙️ Setup

### 1. Clone the Repository
```bash
git clone git@github.com:hegde5/flask-to-beanstalk.git
cd flask-to-beanstalk
```

### 2. Set Up GitHub Secrets
Go to your repository’s **Settings > Secrets and variables > Actions > New repository secret**, and add the following secrets:

| Name                  | Value                  |
|-----------------------|------------------------|
| `AWS_ACCESS_KEY_ID`   | Your IAM user access key ID |
| `AWS_SECRET_ACCESS_KEY` | Your IAM user secret key   |
| `AWS_DEFAULT_REGION`  | e.g., `eu-central-1`      |

### 3. Push Your Flask App to the Main Branch
Search for "TODO" in the repo and double check if you are happy with the names from the boilerplate.
Commit and push your Flask application code. Once the changes hit the `main` branch, the provided GitHub Actions workflow will automatically deploy your app to Elastic Beanstalk.

---

## 🌟 Contributing
Found a bug or have an idea for improvement? Feel free to open an issue or submit a pull request! 

---

## ☕ Sponsor
If you find this project helpful and want to support its development, consider [sponsoring me on Buy Me a Coffee](https://buymeacoffee.com/vinayh). Your support is greatly appreciated!

---

## 📜 License
This project is licensed under the MIT License. See the `LICENSE` file for details.
