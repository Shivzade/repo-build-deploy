#!/bin/bash
set -e

rm -rf /usr/share/nginx/html/*

# Install Nginx only if not already installed
if ! dpkg -l | grep -qw nginx; then
  echo "🔧 Installing NGINX..."
  apt update -y
  apt install -y nginx
else
  echo "✅ NGINX already installed"
fi

# Ensure NGINX is started and enabled
systemctl start nginx
systemctl enable nginx

# Reload NGINX to apply changes
systemctl reload nginx

# Confirm NGINX is running
if systemctl is-active --quiet nginx; then
  echo "✅ NGINX is running"
else
  echo "❌ NGINX failed to start"
  exit 1
fi

