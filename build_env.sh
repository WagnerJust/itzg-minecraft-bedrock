#!/bin/bash

# Default values
DEFAULT_CPUS=2
DEFAULT_PORT=19132
DEFAULT_DATA_DIR="./data"
DEFAULT_SERVER_NAME="Minecraft Bedrock Server"
DEFAULT_DIFFICULTY="normal"

# Get user input with defaults
read -p "How many CPUs to allocate (default: $DEFAULT_CPUS): " CPUS
CPUS=${CPUS:-$DEFAULT_CPUS}

read -p "Local data directory path (default: $DEFAULT_DATA_DIR): " DATA_DIR
DATA_DIR=${DATA_DIR:-$DEFAULT_DATA_DIR}

read -p "Server name (default: $DEFAULT_SERVER_NAME): " SERVER_NAME
SERVER_NAME=${SERVER_NAME:-$DEFAULT_SERVER_NAME}

read -p "Difficulty (peaceful/easy/normal/hard) (default: $DEFAULT_DIFFICULTY): " DIFFICULTY
DIFFICULTY=${DIFFICULTY:-$DEFAULT_DIFFICULTY}

read -p "Local port to map (default: $DEFAULT_PORT): " PORT
PORT=${PORT:-$DEFAULT_PORT}

# Create .env file (overwrite if exists)
cat > .env << EOF
CPUS=$CPUS
DATA_DIR=$DATA_DIR
SERVER_NAME=$SERVER_NAME
DIFFICULTY=$DIFFICULTY
PORT=$PORT
EULA=TRUE
EOF

echo "Created .env file"
echo "Run 'docker compose up -d' to start the server"