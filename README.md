# 🚀 WordPress on EC2 with Docker, Nginx, and HTTPS

Deploy a secure, production-ready WordPress site on an AWS EC2 instance using Docker Compose, Nginx reverse proxy, Let's Encrypt SSL, and auto-generated secrets.

---

## 📦 What's Included

- WordPress + MySQL via Docker Compose  
- Nginx as reverse proxy  
- HTTPS with Certbot & Let's Encrypt  
- Auto-generated secrets for database and WordPress salts  
- Autoheal container for recovery  
- EC2 deployment instructions  
 

---

## ⚙️ Requirements

- AWS EC2 instance (Ubuntu)  
- A domain name pointing to your EC2 public IP  
- Open ports **22**, **80** and **443** in your EC2 Security Group  

---

## 🧠 Quick Start – Full Deployment

### 🖥️ 1. SSH into EC2

```bash
ssh ubuntu@<your-ec2-ip>
```

---
### 🖥️ 2. On Your EC2 Instance

Clone the repository:

```bash
git clone https://github.com/vasiliskou/wordpress-docker-ec2-https.git
cd wordpress-docker-ec2-https

```

---

### ⚙️ 3. Inside the Repository

```bash
# Install Docker
chmod +x setup-docker.sh
sudo ./setup-docker.sh

# Generate secrets (DB password, WordPress salts)
chmod +x generate_secrets.sh
sudo ./generate_secrets.sh

# Run the application (sets up SSL and starts services)
chmod +x run.sh
sudo ./run.sh
```

---

## 🔐 Secrets

Secrets are stored in the `secrets/` folder.

They are auto-generated and include:

- MySQL root and WordPress DB passwords  
- All 8 WordPress authentication salts and keys  

> Permissions are set so that only the container can read them.

---

## 🔁 Common Docker Commands

```bash
sudo docker compose up -d        # Start app in background
sudo docker compose down         # Stop and remove containers
sudo docker logs <container>     # View container logs
sudo docker exec -it <container> bash  # Access container shell
```

---

## 🧾 Final Notes

- Make sure your domain is pointing to your EC2 IP.
- Ports 80 and 443 must be open.
