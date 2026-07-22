# 🛡️ Automated DevSecOps Pipeline: Secure Nginx to AWS ECR

## 🎯 Project Objective
The goal of this project is to build a fully automated, Zero-Touch CI/CD pipeline that implements "Shift-Left Security." It automatically builds a hardened Nginx container, scans it for vulnerabilities, and pushes it to AWS ECR if it passes all security checks.

## 🏗️ Architecture & Workflow
This project utilizes **GitHub Actions** to automate the deployment lifecycle:
1. **Source Code:** Developer pushes code/Dockerfile to the GitHub repository.
2. **CI Trigger:** GitHub Actions automatically triggers the workflow.
3. **AWS Authentication:** Connects to AWS securely using GitHub Secrets (No hardcoded keys).
4. **Build:** Compiles a lightweight Docker image (`nginx:alpine`).
5. **Security Scan:** Runs **Trivy Vulnerability Scanner** to check for OS and library vulnerabilities.
6. **Deploy to Cloud:** If 0 Critical/High vulnerabilities are found, the image is pushed to **Amazon Elastic Container Registry (ECR)**.

**🚀 Pipeline Execution Result:**
<img width="1906" height="452" alt="terminal 4" src="https://github.com/user-attachments/assets/8c68595b-f2e2-4f11-a17a-fe329fbb1259" />


## 🔒 Security Focus
* **Zero-Trust Infrastructure:** AWS credentials (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`) are stored safely in GitHub Secrets.
* **Vulnerability Gate:** The pipeline includes an `exit-code: 1` strict gate. The deployment will fail immediately if Trivy detects any high-risk vulnerabilities.

**🛡️ Cloud Security Result (0 Vulnerabilities):**
<img width="1623" height="769" alt="Screenshot_2026-07-22_12-27-24" src="https://github.com/user-attachments/assets/860ebd08-0e78-4d77-93ae-1271d8593082" />


## 💡 Real-World Troubleshooting
During initial testing, the pipeline failed at the "Build Docker Image" step due to a missing Dockerfile. By analyzing the terminal logs, I traced the exit code, added the required configuration, and successfully restored the automation flow.
