#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🐳 Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh

echo "🧼 Cleaning up..."
rm get-docker.sh

echo "🧼 Everything is perfect"


