#!/bin/bash

# Function to print an error message and exit
error_exit() {
    echo "$1" >&2  # Redirect output to stderr.
    exit 1  # Exit script with error code 1.
}

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    error_exit "Vim is not installed. Please install Vim and try again."
fi

if ! command -v betty &> /dev/null; then
    error_exit "Betty is not installed. Please install Betty and try again."
fi

# Create plugin directory
echo "Creating Vim plugin directory..."
mkdir -p ~/.vim/plugin || error_exit "Failed to create Vim plugin directory."

# Copy Vim plugin to plugins directory
echo "Copying betty-extension.vim to Vim plugin directory..."
cp betty-extension.vim ~/.vim/plugin/ || error_exit "Failed to copy betty-extension.vim to Vim plugin directory."

echo "Installation successful!"
