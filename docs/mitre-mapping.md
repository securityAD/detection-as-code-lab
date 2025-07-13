# MITRE ATT&CK Mapping

| Technique ID | Name                              | Detection File                         | CloudGoat Scenario              |
|--------------|-----------------------------------|----------------------------------------|----------------------------------|
| T1484.1      | Domain or Account Privilege Escalation | `detections/iam_privesc_attach_role.yml` | iam_privesc_by_attachment |
| T1078        | Valid Accounts                    | `detections/suspicious_login.yml`       | (generic AWS login activity)    |