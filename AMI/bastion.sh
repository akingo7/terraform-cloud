#!/bin/bash

sudo yum install -y mysql-server wget vim telnet htop git python3 net-tools zip git
sudo systemctl start chronyd
sudo systemctl enable chronyd
git clone https://github.com/akingo7/terraform-cloud.git