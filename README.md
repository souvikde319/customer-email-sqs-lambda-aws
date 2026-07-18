# 📧 Customer Email Notification System using AWS Lambda, Amazon SQS, Amazon SES & Terraform

## 🚀 Project Overview

This project demonstrates a **production-style serverless event-driven architecture** on AWS using **Terraform** as Infrastructure as Code (IaC).

When a customer places an order, the application sends a message to **Amazon SQS**. The SQS queue automatically triggers an **AWS Lambda** function, which processes the message and sends an email notification using **Amazon SES**.

This project showcases real-world DevOps practices including Terraform, IAM Roles, SQS, Lambda, SES, CloudWatch Logs, and Dead Letter Queues (DLQ).

---

# 🏗️ Architecture

```text
                    Customer / Application
                             │
                             ▼
                     Amazon SQS Queue
                             │
              Event Source Mapping
                             │
                             ▼
                   AWS Lambda (Python)
                  ┌──────────┴──────────┐
                  ▼                     ▼
          Amazon SES             CloudWatch Logs
                  │
                  ▼
          Customer Email Notification

                  ▲
                  │
         Dead Letter Queue (DLQ)
      (Stores failed messages after retries)
```

---

# 📁 Project Structure

```text
customer-email-notification/

├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── sqs.tf
│   ├── iam.tf
│   ├── lambda.tf
│   ├── outputs.tf
│
├── lambda/
│   ├── lambda_function.py
│   ├── requirements.txt
│   ├── zip.sh
│   └── lambda.zip
│
└── README.md
```

---

# 🛠️ Technologies Used

* AWS Lambda
* Amazon SQS
* Amazon SES
* Amazon CloudWatch
* IAM Roles & Policies
* Terraform
* Python 3.x
* AWS CLI

---

# 🔄 Project Flow

```text
Application
     │
     ▼
Send Order Details
     │
     ▼
Amazon SQS Queue
     │
     ▼
Event Source Mapping
     │
     ▼
AWS Lambda Triggered
     │
     ▼
Read JSON Message
     │
     ▼
Send Email using Amazon SES
     │
     ▼
Write Logs to CloudWatch
     │
     ▼
Delete Message from Queue

If processing fails:
     │
     ▼
Retry (maxReceiveCount)
     │
     ▼
Dead Letter Queue (DLQ)
```

---

# ⚙️ Prerequisites

* AWS Account
* AWS CLI Configured
* Terraform Installed
* Python Installed
* Verified Email Identity in Amazon SES
* IAM Permissions

---

# 🚀 Deployment Steps

## 1. Clone Repository

```bash
git clone <repository-url>
cd customer-email-notification
```

---

## 2. Configure AWS CLI

```bash
aws configure
```

---

## 3. Initialize Terraform

```bash
cd terraform

terraform init
```

---

## 4. Validate Configuration

```bash
terraform validate
```

---

## 5. Review Infrastructure

```bash
terraform plan
```

---

## 6. Deploy Infrastructure

```bash
terraform apply
```

---

## 7. Package Lambda Function

```bash
cd ../lambda

chmod +x zip.sh

./zip.sh
```

---

## 8. Re-deploy Lambda

```bash
cd ../terraform

terraform apply
```

Terraform automatically uploads the latest Lambda package because `source_code_hash` detects code changes.

---

# 📩 Test the Application

## Send a message to Amazon SQS

```json
{
  "customer_name": "Souvik De",
  "email": "your_verified_email@example.com",
  "order_id": "ORD-1001",
  "amount": "999"
}
```

Once the message is sent:

```
SQS
   │
   ▼
Lambda Triggered
   │
   ▼
SES Sends Email
   │
   ▼
Customer Receives Email
```

---

# 📊 Monitoring

Monitor the Lambda execution in:

```
AWS Console
    ↓
CloudWatch
    ↓
Log Groups
```

Logs include:

* Lambda Invocations
* Errors
* SES Response
* Execution Duration
* Memory Usage

---

# 🔒 Security

* IAM Role for Lambda
* Least-Privilege Access (recommended for production)
* No Access Keys stored in code
* Server-side encrypted SQS queue
* Dead Letter Queue for failed messages

---

# 📌 Features

* Infrastructure as Code using Terraform
* Serverless Architecture
* Event-Driven Processing
* Automatic Lambda Invocation
* Email Notifications via SES
* CloudWatch Logging
* Dead Letter Queue Support
* Scalable & Cost Effective

---

# 📈 Future Enhancements

* GitHub Actions CI/CD
* Terraform Remote Backend (S3 + DynamoDB)
* CloudWatch Alarms
* SNS Notifications
* Secrets Manager / Parameter Store
* Custom IAM Policies
* Custom Email Templates
* Multi-environment Deployment (Dev, QA, Prod)

---

# 🎯 DevOps Concepts Covered

* Infrastructure as Code (Terraform)
* AWS Lambda
* Amazon SQS
* Amazon SES
* IAM Roles
* CloudWatch
* Event Source Mapping
* Serverless Computing
* Dead Letter Queue
* Cloud Security
* Logging & Monitoring

---

# 👨‍💻 Author

**Souvik De**

📧 Email: [techsj04@gmail.com](mailto:techsj04@gmail.com)

🔗 LinkedIn: https://www.linkedin.com/in/souvik-de-567942126/

📱 whatsapp: +91-9775483913

---

## ⭐ If you found this project useful, don't forget to Star ⭐ the repository.
