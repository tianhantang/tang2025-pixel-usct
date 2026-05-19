#!/bin/bash

# @file: build-container.sh
# @usage: ./build-container.sh <function_name>

set -euo pipefail

# === Function Definitions
create_latex_dev_img() {
	local image_name="pd-acoustics:latest"

	# Check if local image already exists
	if docker image inspect "$image_name" >/dev/null 2>&1; then
		echo "[INFO] Docker image $image_name already exists, skipping build."
	else
		echo "[INFO] Building Docker image $image_name..."
		docker build --network=host -f Dockerfile.python-dev -t "$image_name" .
	fi
}

# === Helper Functions

usage() {
	echo "Usage: $0 <function_name>"
	echo "Available functions:"
	echo "  - create_latex_dev_img"
}

# === Main execution logic

# Check if a function name was provided
if [ $# -eq 0 ]; then
	usage
	exit 1
fi

# Get the function name from the first argument
FUNCTION_NAME="$1"

# Check if the function exists and call it
if declare -f "$FUNCTION_NAME" > /dev/null; then
	echo "Calling function: $FUNCTION_NAME"
	"$FUNCTION_NAME"
else
	echo "Error: Function '$FUNCTION_NAME' not found."
	usage
	exit 1
fi
