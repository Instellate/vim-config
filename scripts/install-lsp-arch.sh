#!/bin/bash
# Installs all the LSPs required for this projecte excluding rust
# Setup cargo yourself either through rustup or other methods

sudo pacman -S --needed clang npm dotnet-host-bin lua-language-server
npm install -g  typescript typescript-language-server \
    bash-language-server dockerfile-language-server-nodejs \
    @microsoft/compose-language-service
dotnet install --global csharp-ls

