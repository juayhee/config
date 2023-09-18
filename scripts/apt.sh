#!/bin/bash

set -euo pipefail

sudo apt-get update -y || apt-get update -y
sudo apt-get upgrade -y || apt-get update -y
sudo apt-get install -y || apt-get install -y \
    build-essential \
    git \
    curl
