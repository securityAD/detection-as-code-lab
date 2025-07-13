# 🛡️ Detection-as-Code Lab: AWS Threat Simulation & Custom Detection Rules

This lab simulates real-world AWS attack scenarios using [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat), captures security logs (CloudTrail, VPC Flow Logs, etc.), and uses **Detection-as-Code** techniques with **Sigma rules** and custom logic to detect malicious behavior.

> 🔍 **Goal:** Demonstrate practical detection engineering skills in cloud environments by building and documenting a full attacker-emulation-to-detection pipeline.

---

## 📌 Project Goals

- Simulate adversary behavior in AWS using CloudGoat
- Capture logs using AWS native logging tools (CloudTrail, VPC Flow Logs, etc.)
- Build custom detections using Sigma rules (YAML) and/or Python
- Document attacker playbooks and detection logic tied to MITRE ATT&CK
- Showcase Detection-as-Code workflows for Security/Cloud Engineers

---

## 🛠️ Tools & Technologies

| Category         | Tools Used |
|------------------|------------|
| Attack Simulation | [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) |
| Cloud Platform   | AWS (CloudTrail, S3, IAM, VPC Logs) |
| Detection Logic  | Sigma, Python |
| Optional Stack   | OpenSearch / Elastic / custom Lambda-based processing |
| Infra-as-Code    | Terraform (if applicable) |

---

## 🧪 Lab Architecture (Simplified)

```
[CloudGoat Scenario] 
     ↓
[CloudTrail / VPC Logs / S3 Access Logs]
     ↓
[Log Ingestion Pipeline (S3 → OpenSearch or Lambda)]
     ↓
[Detections (Sigma Rules or Python)]
     ↓
[Alerts / Dashboarding / Documentation]
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

### 2. Enable Logging in AWS
- ✅ CloudTrail (across regions)
- ✅ VPC Flow Logs
- ✅ S3 Access Logging (if applicable)

### 3. Simulate Attacks & Observe Logs
- Follow attacker path defined in `playbooks/`
- Confirm log events appear in destination (S3 or OpenSearch)

### 4. Write Detection Rules
- Place rules in `detections/` (YAML or Python)
- Map each rule to a MITRE ATT&CK technique
- Include example log entries that trigger each rule

---

## 📂 Project Structure

```
.
├── cloudgoat-scenarios/      # CloudGoat environments
├── detections/               # Sigma/Python detection rules
├── log-pipeline/             # Ingestion & parsing logic
├── playbooks/                # Attack walkthroughs + detection analysis
├── terraform/                # Optional IaC for AWS log setup
├── docs/                     # Architecture diagrams, rule mappings
└── README.md                 # You're here!
```

---

## 🧠 Use Case: Why This Project Matters

This lab mimics how real detection engineers, cloud security analysts, and incident responders:
- Simulate threats in the cloud
- Write structured detections for security signals
- Build and test against actual attacker behavior

It's designed to reflect workflows in modern cloud-native security teams, with a focus on **Detection-as-Code** and **cloud log telemetry**.

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
Cloud Security / Detection Engineer | [LinkedIn](https://www.linkedin.com/in/aaron918/) | [GitHub](https://github.com/SecurityAD)

---

## 📝 License

This lab is intended for educational and demonstration purposes only. Use responsibly and only against your own cloud environments.
