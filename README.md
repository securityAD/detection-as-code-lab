# 🛡️ Detection-as-Code Lab: AWS Threat Simulation & Custom Detection Rules

This lab simulates real-world AWS attack scenarios using [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat), captures security logs (CloudTrail, VPC Flow Logs, etc.), and uses **Detection-as-Code** techniques with **Sigma rules** and custom logic to detect malicious behavior.

> 🔍 **Goal:** Demonstrate practical detection engineering skills in cloud environments by building and documenting a full attacker-emulation-to-detection pipeline.

---

## 📌 Project Goals

- Simulate adversary behavior in AWS using CloudGoat
- Capture logs using AWS-native logging tools (CloudTrail, VPC Flow Logs)
- Build custom detections using Sigma rules (YAML) and/or Python
- Document attacker playbooks and detection logic tied to MITRE ATT&CK
- Showcase Detection-as-Code workflows for Security/Cloud Engineers

---

## 🛠️ Tools & Technologies

| Category         | Tools Used |
|------------------|------------|
| Attack Simulation | [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) |
| Cloud Platform   | AWS (CloudTrail, S3, IAM, VPC Logs) |
| Logging Infra    | Terraform |
| Detection Logic  | Sigma, Python |
| Optional Stack   | OpenSearch / Elastic / custom Lambda-based parsing |

---

## 🧪 Lab Architecture (Simplified)

```
[Terraform Infrastructure Provisioning]
     ↓
[Logging: CloudTrail + VPC Flow Logs + S3 Access Logs]
     ↓
[CloudGoat: Deploy Vulnerable AWS Environment]
     ↓
[Manual Attack Simulation (via CloudGoat walkthroughs)]
     ↓
[Log Collection & Ingestion]
     ↓
[Detections (Sigma Rules or Python)]
     ↓
[Alerts / Dashboards / Documentation]
```

> 🖼️ _Architecture diagram to be added in `/docs/` soon._

---

## 🚀 Getting Started

### 1. Clone & Install CloudGoat
```bash
git clone https://github.com/RhinoSecurityLabs/cloudgoat.git
cd cloudgoat
./cloudgoat.py config profile
./cloudgoat.py create iam_privesc_by_attachment
```

---

### 2. Deploy AWS Logging Infrastructure with Terraform

In the `terraform/` directory of this repo:

```bash
cd terraform
terraform init
terraform apply
```

This sets up:
- S3 bucket for CloudTrail
- Multi-region CloudTrail trail
- CloudWatch log group for VPC flow logs
- IAM role for logging
- Flow logs for your default VPC

> ✅ The VPC is dynamically selected using `data "aws_vpc" "default"` — no manual VPC ID needed.

---

### 3. Simulate Attacks & Observe Logs

- Follow attack playbooks in `playbooks/`
- Confirm logs appear in CloudTrail, CloudWatch, or S3

---

### 4. Write Detection Rules

- Place rules in `detections/` (YAML or Python)
- Map each rule to a MITRE ATT&CK technique
- Include sample log excerpts in rule comments

---

## 📂 Project Structure

```
.
├── cloudgoat-scenarios/      # CloudGoat environments
├── detections/               # Sigma/Python detection rules
├── log-pipeline/             # Log ingestion/parsing code (if any)
├── playbooks/                # Attack walkthroughs + detection analysis
├── terraform/                # Terraform infrastructure setup
├── docs/                     # Architecture diagrams, ATT&CK mappings
└── README.md                 # You're here!
```

---

## 🧠 Use Case: Why This Project Matters

This lab mimics how real detection engineers, cloud security analysts, and incident responders:
- Simulate threats in the cloud
- Write structured detections for cloud log telemetry
- Build and test Detection-as-Code workflows

---

## 📚 MITRE ATT&CK Coverage

| Technique ID | Name | Detection File |
|--------------|------|----------------|
| T1078 | Valid Accounts | `detections/suspicious_login.yml` |
| T1484.1 | IAM Privilege Escalation | `detections/iam_privesc_attach_role.yml` |
| ... | ... | ... |

---

## 📌 Future Improvements

- [ ] Add detection CI/CD pipeline
- [ ] Integrate OpenSearch dashboards
- [ ] Include auto-remediation Lambda examples
- [ ] Publish Sigma rules as a standalone detection repo

---

## 👨‍💻 Author

**Aaron Diaz**  
Cloud Security / Detection Engineer | [LinkedIn](https://www.linkedin.com/) | [GitHub](https://github.com/)

---

## 📝 License

This lab is intended for educational and demonstration purposes only. Use responsibly and only against your own cloud environments.
