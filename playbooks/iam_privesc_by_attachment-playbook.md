# Playbook: IAM Privilege Escalation via Attachment

## 🎯 Objective
Gain administrative privileges by abusing the ability to attach a more privileged IAM role to an EC2 instance.

## 🧪 Steps Taken
1. Enumerate current permissions using `enumerate-iam`
2. Identify ability to attach a role to EC2
3. Attach admin role to EC2 instance
4. Use EC2 metadata service to retrieve temporary credentials
5. Assume elevated privileges

## 📜 Log Sources
- **CloudTrail**: IAM role attachment, EC2 metadata access
- **VPC Flow Logs**: Access to 169.254.169.254 (metadata service)

## 🔍 Detection Opportunities
- IAM `AttachRolePolicy` or `PassRole` usage
- EC2 metadata access from unexpected users or roles

## 🧠 Mapped to MITRE ATT&CK
- **T1484.1**: Domain or account privilege escalation
- **T1078**: Valid accounts (when reusing credentials)