#!/bin/bash

# Where your repo is
REPO_DIR="$HOME/system-logs"

cd "$REPO_DIR" || exit 1

# Load your latest shell history into memory
history -r ~/.bash_history

# Save history to file
history > history.txt

# Save CPU & RAM usage to file
echo "=== CPU & RAM Usage ($(date)) ===" > cpu_ram.txt
top -b -n1 | head -n 15 >> cpu_ram.txt

# Commit & push to GitHub
git add history.txt cpu_ram.txt
git commit -m "Log update: $(date)"
git push origin main

