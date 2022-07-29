#!/bin/bash
set -e
# Download the binary
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.1.3/argo-darwin-amd64.gz
# Unzip
gunzip argo-darwin-amd64.gz
# Make binary executable
chmod +x argo-darwin-amd64
# Move binary to path
sudo mv ./argo-darwin-amd64 /usr/local/bin/argo