#!/bin/bash

# Simple cache cleaning script for macOS

echo "Starting cache clean-up for your Mac..."

# Requires administrative privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Clearing system caches
echo "Clearing system caches..."
rm -rf /Library/Caches/*
rm -rf /System/Library/Caches/*

# Clearing user caches
echo "Clearing user caches..."
rm -rf ~/Library/Caches/*

# Optional: Clearing system logs
echo "Clearing system logs..."
rm -rf /var/log/*

# Optional: Clearing application logs
echo "Clearing application logs..."
rm -rf ~/Library/Logs/*

# Recreating necessary folders to avoid system errors
mkdir /Library/Caches
mkdir /System/Library/Caches
mkdir ~/Library/Caches
mkdir /var/log
mkdir ~/Library/Logs

echo "Cache clean-up completed!"

# Warning: This script is a basic example and might have unintended consequences.
# Always back up your data before running such scripts.
