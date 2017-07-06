#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get purge openjdk* default-jre
sudo apt-get remove docker docker-engine docker.io
#sudo apt-get -y update
sudo apt-get -y install postgresql-9.4
sudo apt-get -y install postgresql-client
sudo apt-get -y install git
sudo apt-get -y install curl
sudo apt-get -y install git-flow
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install linux-image-extra-virtual
sudo apt-get -y install apt-transport-https ca-certificates software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update

sudo apt-get -y install docker-ce
sudo apt install -y python-pip
sudo pip install --upgrade pip
sudo pip uninstall docker-py
sudo pip uninstall docker
sudo pip install docker
sudo pip install docker-compose


sudo mkdir /home/java
sudo cp /vagrant/jdk-8u131-linux-x64.tar.gz /home/java/
cd /home/java/
sudo tar -xvf jdk-8u131-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /home/java/jdk1.8.0_131/jre/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /home/java/jdk1.8.0_131/bin/javac 2000
sudo update-alternatives --config java
sudo update-alternatives --config javac

sudo cat > /etc/profile.d/oraclejdk.sh <<-EOF
export J2SDKDIR=/home/java/jdk1.8.0_131
export J2REDIR=/home/java/jdk1.8.0_131/jre
export PATH=$PATH:/home/java/jdk1.8.0_131/bin:/home/java/jdk1.8.0_131/db/bin:/home/java/jdk1.8.0_131/jre/bin
export JAVA_HOME=/home/java/jdk1.8.0_131
export DERBY_HOME=/home/java/jdk1.8.0_131/db
EOF

echo "path JDK path set complete"

sudo sh /etc/profile.d/oraclejdk.sh

echo "source to JDK path complete endof script"

sudo apt-get -y update
sudo apt-get -y upgrade