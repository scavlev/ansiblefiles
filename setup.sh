#!/bin/bash

set -x

cd "${0%/*}"
current_dir=$PWD

sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

curl https://pyenv.run | bash

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

git clone https://github.com/momo-lab/xxenv-latest.git "$(pyenv root)"/plugins/xxenv-latest

pyenv latest install -s
pyenv latest global

pip install --upgrade pip ansible setuptools jmespath

cd "$HOME/.pyenv/versions/$(pyenv version-name)/lib/python$(pyenv version-name | cut -c1-3)/site-packages"
apt download python3-apt
dpkg -x python3-apt_*.deb python3-apt
cp -r python3-apt/usr/lib/python3/dist-packages/* .
mv apt_pkg.*.so apt_pkg.so
mv apt_inst.*.so apt_inst.so

cd $current_dir
./ansiblefiles.sh "$@"
