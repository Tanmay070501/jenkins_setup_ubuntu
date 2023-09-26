# Jenkins Installation and Setup Guide

This guide will walk you through the process of installing Jenkins on an Ubuntu server.

## Prerequisites

- An Ubuntu server with sudo privileges.

## Installation Steps

```bash
# 1. Update the package list to ensure you have the latest information about available packages:
sudo apt update -y

# 2. Install Git, which will be used to clone the Jenkins setup repository:
sudo apt install -y git

# 3. Clone the Jenkins setup repository to your server. This repository contains scripts and configurations for Jenkins installation:
git clone https://github.com/Tanmay070501/jenkins_setup_ubuntu.git

# 4. Make the setup script executable by changing its permissions:
sudo chmod +x jenkins_setup_ubuntu/setup.sh

# 5. Run the setup script to install Jenkins:
./jenkins_setup_ubuntu/setup.sh
