#!/bin/bash
# Deploy Oxford Marble Specialist website to Dplooy.
# Usage: ./deploy.sh [/path/to/site/dir]
#
# IMPORTANT: Must pass `projectName`, not `projectId`.
# Dplooy's /deploy/zip ignores projectId and creates a new project.
# projectName=syfer-client-test triggers isRedeploy: true.

set -euo pipefail

SITE_DIR="${1:-$HOME/oms-website}"
PROJECT_NAME="syfer-client-test"
API_KEY=$(grep DPLOOY_API_KEY ~/.hermes/credentials/.env.dplooy | cut -d= -f2)
ZIP_PATH="/tmp/oms-deploy.zip"

if [ ! -d "$SITE_DIR" ]; then
  echo "ERROR: $SITE_DIR not found"
  exit 1
fi

if [ -z "$API_KEY" ]; then
  echo "ERROR: DPLOOY_API_KEY not found in ~/.hermes/credentials/.env.dplooy"
  exit 1
fi

echo "=== Zipping $SITE_DIR ==="
rm -f "$ZIP_PATH"
cd "$SITE_DIR"
zip -r "$ZIP_PATH" . \
  -x "*.md" ".gitignore" ".git/*" "source-originals/*" \
  -x "deploy.sh" "deploy.bat" \
  > /dev/null

echo "=== Deploying to Dplooy (projectName=$PROJECT_NAME) ==="
RESPONSE=$(curl -sS -X POST "https://api.dplooy.com/api/v1/deploy/zip" \
  -H "Authorization: Bearer $API_KEY" \
  -F "file=@$ZIP_PATH" \
  -F "projectName=$PROJECT_NAME")

echo "$RESPONSE" | python3 -m json.tool

# Check if it was a redeploy
if echo "$RESPONSE" | python3 -c "import json,sys; sys.exit(0 if json.load(sys.stdin).get('isRedeploy') else 1)" 2>/dev/null; then
  echo
  echo "✓ REDEPLOY successful. Site updated at: https://${PROJECT_NAME}.dplooy.com"
else
  # Check if it was a success but new project
  if echo "$RESPONSE" | python3 -c "import json,sys; sys.exit(0 if json.load(sys.stdin).get('success') else 1)" 2>/dev/null; then
    URL=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('url','unknown'))")
    echo
    echo "⚠ Created NEW project (NOT a redeploy). This may be an orphan — check projects list."
    echo "  URL: $URL"
  else
    echo
    echo "ERROR: Deploy failed"
    echo "$RESPONSE"
    exit 1
  fi
fi
