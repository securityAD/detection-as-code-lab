# CloudGoat Scenario: iam_privesc_by_attachment

This scenario demonstrates an IAM privilege escalation path through an over-permissive IAM role attachment.

### 📦 Objective
Start with a limited IAM user and escalate privileges by attaching a more powerful IAM role to an existing EC2 instance.

### 🛠️ Setup Instructions
```bash
./cloudgoat.py create iam_privesc_by_attachment
```

### 📂 Resources Created
- IAM user with limited privileges
- EC2 instance with an attachable role
- Over-permissive IAM policy

### ⚠️ Vulnerability
The IAM user can attach any role to the EC2 instance due to the overly permissive IAM policy (`iam:AttachRolePolicy`), allowing privilege escalation.