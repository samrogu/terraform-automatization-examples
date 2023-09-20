#!/bin/bash
echo "Setup Server"
sudo yum update
sudo yum -y install python pip
python -m pip install --user pipx
pipx install --include-deps ansible