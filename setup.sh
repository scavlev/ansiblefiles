#!/bin/bash

set -x

cd "${0%/*}"
current_dir=$PWD

sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

curl https://pyenv.run | bash

git clone https://github.com/momo-lab/xxenv-latest.git "$(pyenv root)"/plugins/xxenv-latest

pyenv latest install -s
pyenv latest global

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

pip install --upgrade --user pip ansible jmespath

cd $current_dir
./ansiblefiles.sh "$@"
