#!/bin/bash
# Installs all LSPs for debian/ubuntu
set -e

sudo apt-get update
sudo apt-get install clangd

curl -O https://dot.net/v1/dotnet-install.sh
chmod +X dotnet-install.sh
sudo ./dotnet-install.sh --channel LTS
rm -f dotnet-install.sh
dotnet install --global csharp-ls

