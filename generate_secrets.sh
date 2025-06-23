#!/bin/bash

# ---------------------------------------------
# Bash Script: generate-secrets.sh
# Generates secrets for WordPress & MySQL in Base64 format.
# ---------------------------------------------

set -e  # Exit on any error

SECRETS_DIR="secrets"

# 1. Create secrets directory if it doesn't exist
mkdir -p "$SECRETS_DIR"

# 2. Helper function to generate Base64 secrets
generate_secret() {
  openssl rand -base64 "$1"
}

# 3. Generate MySQL secrets (32 bytes)
MYSQL_SECRETS=("mysql_root_password" "wp_db_password")
for name in "${MYSQL_SECRETS[@]}"; do
  generate_secret 32 > "$SECRETS_DIR/$name.txt"
done

# 4. Generate WordPress keys and salts (64 bytes)
WP_SECRETS=(
  "wp_auth_key" "wp_secure_auth_key" "wp_logged_in_key" "wp_nonce_key"
  "wp_auth_salt" "wp_secure_auth_salt" "wp_logged_in_salt" "wp_nonce_salt"
)
for name in "${WP_SECRETS[@]}"; do
  generate_secret 64 > "$SECRETS_DIR/$name.txt"
done

# 5. Modify permissions (optional but recommended)
chmod 755 secrets       # allows you to cd into it
chmod 644 secrets/*.txt # readable inside containers


echo "✅ Secret files created in '$SECRETS_DIR' with secure permissions."
