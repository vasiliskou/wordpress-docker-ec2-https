#!/bin/bash

set -e  # Exit immediately if a command fails

# Step 1: Use bootstrap config
cp nginx/bootstrap.conf nginx/default.conf

# Step 2: Start all containers except certbot
docker compose up -d wordpress db nginx autoheal

# Step 3: Request certificate
docker compose run --rm certbot

# Step 4: Switch to full HTTPS config
cp nginx/default-ssl.conf nginx/default.conf

# Step 5: Restart Nginx
docker compose restart nginx

# to run this script execute: sudo ./run.sh