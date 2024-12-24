#!/bin/bash
set -e

if ! command -v java &> /dev/null; then
    apt-get update
    apt-get install -y --no-install-recommends \
        openjdk-17-jre-headless \
        curl \
        wget \
        ca-certificates

    # Install Node.js 18.x
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
    apt-get install -y nodejs
    
    # Install yarn
    npm install -g yarn
    
    rm -rf /var/lib/apt/lists/*
fi

mkdir -p /app
cd /app/external/+non_module_dependencies+unitycatalog

# Start UI server in background
cd ui
echo "Starting UI server..."
yarn install
yarn start > /var/log/ui.log 2>&1 &

cd ..
echo "UI server started, launching UC server..."
exec bin/start-uc-server