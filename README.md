
# Micro-Project: Nginx Container Hardening and Optimization

## Overview
This is a DevSecOps micro-project (Proof of Concept) focused on building a secure, production-ready Nginx web server using Docker. The primary goal of this project was to implement Shift-Left security practices by patching vulnerabilities at the base image level and optimizing the final image footprint using Multi-Stage builds.

## Tech Stack
- **Containerization:** Docker
- **Base Image:** Nginx (Alpine Linux)
- **Security Scanner:** Trivy (Aqua Security)

## Process & Implementation
1. **Initial Build & Security Scanning:** 
   - Built a basic Nginx container using the `nginx:alpine` image.
   - Conducted an initial vulnerability scan using Trivy, identifying several outdated packages.
2. **Container Hardening:** 
   - Updated the Dockerfile to patch OS-level vulnerabilities (`apk update && apk upgrade`) before deploying the application.
3. **Image Optimization (Multi-Stage Build):**
   - Refactored the Dockerfile into a Multi-Stage process.
   - **Stage 1:** Handled package updates and build dependencies.
   - **Stage 2:** Copied only the necessary artifacts into a fresh base image, leaving temporary caches and build tools behind.

## Results & Impact
- **Security Posture:** Achieved a baseline of **0 vulnerabilities** (verified via Trivy).
- <img width="1150" height="445" alt="Screenshot_2026-07-16_13-41-53" src="https://github.com/user-attachments/assets/86725c77-fd47-4d20-95ad-930873616de4" />
- **Storage Optimization:** Reduced the final production image size from **67.7MB** to **65.5MB**, minimizing the attack surface and improving deployment speed.
<img width="755" height="117" alt="Screenshot_2026-07-16_13-58-19" src="https://github.com/user-attachments/assets/3c201099-7ba7-4b99-accb-f4b46653e451" />
## Files Included
- `Dockerfile`: Contains the multi-stage build instructions.
- `index.html`: A sample web page served by the Nginx container.

## Conclusion
This micro-project demonstrates the importance of not just containerizing applications, but doing so securely and efficiently for production environments.
