#!/bin/bash

# Test Checkpoint 1 - Send response to n8n webhook
# Usage: ./test_checkpoint1.sh YOUR-WEBHOOK-URL

if [ -z "$1" ]; then
  echo "❌ Error: Please provide webhook URL"
  echo "Usage: ./test_checkpoint1.sh https://geetad.app.n8n.cloud/webhook-waiting/XX"
  exit 1
fi

WEBHOOK_URL="$1"

echo "🚀 Sending checkpoint response to: $WEBHOOK_URL"
echo ""

curl -X POST "$WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "interest_level": "exploring",
    "decision": "approved"
  }'

echo ""
echo ""
echo "✅ Request sent!"
