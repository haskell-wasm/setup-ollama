#!/usr/bin/env bash

set -euo pipefail

curl -fsSL https://ollama.com/install.sh | sh

if [[ $OVERRIDE_CONF != "" ]]; then
  sudo mkdir -p /etc/systemd/system/ollama.service.d
  echo "$OVERRIDE_CONF" | sudo tee /etc/systemd/system/ollama.service.d/override.conf

  sudo systemctl daemon-reload
  sudo systemctl restart ollama.service
fi
