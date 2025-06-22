# Task 0: Simple Web Stack

## Diagram
[Diagram Image Link Here - e.g. https://i.imgur.com/abc123.png]

## GitHub File Link
https://github.com/your-username/alx-system_engineering-devops/blob/main/0x09-web_infrastructure_design/0-simple_web_stack

## Components
- Server (IP: 8.8.8.8)
- Domain: www.foobar.com → A record to server IP
- Nginx Web Server
- Application Server (PHP/Gunicorn)
- Application Files (Codebase)
- MySQL Database

## Flow
User → DNS Lookup → IP → Server (Nginx) → App Server → DB → Response

## Issues
- SPOF: If server crashes, site goes down
- No scalability
- Downtime during deployment

