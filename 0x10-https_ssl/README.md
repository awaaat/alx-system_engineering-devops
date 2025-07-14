# HTTPS SSL Project

## Overview
This project focuses on understanding and implementing HTTPS and SSL concepts in a DevOps and system administration context. The primary task is to configure DNS records for a domain and its subdomains (`www`, `lb-01`, `web-01`, `web-02`) to point to the appropriate server IPs, and to create a Bash script that audits DNS records using the `dig` command.

## Learning Objectives
At the end of this project, you should be able to explain:
- What HTTPS and SSL are and their two main roles (authentication and encryption).
- The purpose of encrypting website traffic.
- The meaning of SSL termination.

## Requirements
- **Environment**: Ubuntu 16.04 LTS
- **Editors**: vi, vim, emacs
- **Script Requirements**:
  - Bash scripts must be executable and pass Shellcheck (version 0.3.7) without errors.
  - First line: `#!/usr/bin/env bash`
  - Second line: A comment describing the script's purpose.
  - Use `awk` and at least one Bash function in the script.
- **DNS Configuration**:
  - Subdomain `www` points to the load balancer IP (`lb-01`).
  - Subdomain `lb-01` points to the load balancer IP.
  - Subdomain `web-01` points to the `web-01` server IP.
  - Subdomain `web-02` points to the `web-02` server IP.

## Task: World Wide Web
### File: `0-world_wide_web`
This Bash script audits DNS records for a given domain and its subdomains. It accepts two arguments:
- `domain`: The domain name to audit (mandatory).
- `subdomain`: A specific subdomain to audit (optional).

### Usage
```bash
./0-world_wide_web <domain> [subdomain]