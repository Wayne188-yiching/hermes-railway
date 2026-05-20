#!/bin/bash
set -e

echo "Starting Hermes Telegram Bot..."

# Create .env file from Railway environment variables
cat > /root/.hermes/.env << EOF
# Telegram Integration
TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}
TELEGRAM_ALLOWED_USERS=${TELEGRAM_ALLOWED_USERS}
TELEGRAM_HOME_CHANNEL=${TELEGRAM_HOME_CHANNEL}

# AI Provider
ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
EOF

echo "Configuration loaded. Starting gateway..."

# Start hermes gateway in foreground
exec hermes gateway start
