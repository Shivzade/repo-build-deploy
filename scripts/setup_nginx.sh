#!/bin/bash
set -e  # Exit immediately on error

# Update package list
apt update -y

# Install Nginx
apt install -y nginx

# Start Nginx and enable on boot
systemctl start nginx
systemctl enable nginx

# Check Nginx status
if systemctl status nginx | grep "active (running)"; then
    echo "✅ Nginx is running"
else
    echo "❌ Failed to start Nginx"
    exit 1
fi

# Optional: Restart Nginx after deployment
systemctl restart nginx

