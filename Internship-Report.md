1. Introduction
1.1. Project overview
1.2. Scope of works
1.3. Team members
2. Requirement
2.1. Requirement description
2.2. Technical requirements
Environment:
    OS: [Ubuntu 24.04.02]
    Containerization: [Docker]
Security:
Logging & Monitoring:
Reliability:
3. Solution Architecture
3.1. Solution Overview
3.2. Main Components
3.3. Execution Workflow
4. Implementation Guide
4.1. Related Files/Scripts
Repository Structure:
project-root/
├──scripts/
│    ├──log.sh
│    ├──mail_send.log
│    ├──monitor.sh
│
4.2. Initial Setup
Prerequisites:
Install and set up Oracle VM
Configuration Steps:

    #Setup for send email
    sudo apt update
    sudo apt install msmtp mailutills

    #Configure msmtp
    defaults
    auth on
    tls on
    tls_trust_file /etc/ssl/certs/ca-certificates.crt
    logfile ~/.msmtp.log
    account gmail
    host smtp.gmail.com
    port 587
    from pptloc28@gmail.com
    user pptloc28@gmail.com
    password app password
    account default : gmail

    #Set permissions:
    chmod 600 ~/.msmtprc 

4.3 Configuration Variables
5. Appendix
5.1. Tool Used
5.2. References
