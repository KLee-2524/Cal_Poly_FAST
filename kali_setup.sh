#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Update the package list
apt update -y

# Install Kali Top 10 Tools
apt install kali-tools-top10 -y