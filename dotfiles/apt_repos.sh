#!/bin/bash

UBUNTU_CODENAME=$(. /etc/os-release && echo $UBUNTU_CODENAME)

sudo mkdir -p /etc/apt/keyrings

### Docker ###

curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

### Solaar ###

curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x643FF34AF9151DC814DD3A1B2303D595EE907473" | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/solaar.gpg

echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/solaar.gpg] https://ppa.launchpadcontent.net/solaar-unifying/stable/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/solaar.list >/dev/null

### LibreOffice ###

curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x36E81C9267FD1383FCC4490983FBA1751378B444" | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/libreoffice.gpg

echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/libreoffice.gpg] https://ppa.launchpadcontent.net/libreoffice/ppa/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/libreoffice.list >/dev/null

### Chrome ###

curl -fsSL "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/chrome.gpg

echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list >/dev/null

### Microsoft ###

curl -fsSL "https://packages.microsoft.com/keys/microsoft.asc" | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/microsoft.gpg

echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
