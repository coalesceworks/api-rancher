#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get purge openjdk* default-jre
sudo apt-get remove docker docker-engine docker.io
#sudo apt-get -y install postgresql-9.4
#sudo apt-get -y install postgresql-client
sudo apt-get -y install git
sudo apt-get -y install curl
sudo apt-get -y install git-flow
sudo apt install -y unzip
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install linux-image-extra-virtual
sudo apt-get -y install apt-transport-https ca-certificates software-properties-common
sudo apt install -y python-pip
sudo pip install --upgrade pip


curl https://releases.rancher.com/install-docker/17.03.sh | sh
sudo usermod -aG docker ubuntu

sudo pip install docker-compose
sudo usermod -aG docker-compose ubuntu

sudo mkdir /home/java
sudo cp /vagrant/jdk-8u131-linux-x64.tar.gz /home/java/
cd /home/java/
sudo tar -xvf jdk-8u131-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /home/java/jdk1.8.0_131/jre/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /home/java/jdk1.8.0_131/bin/javac 2000
sudo update-alternatives --config java
sudo update-alternatives --config javac

sudo wget https://services.gradle.org/distributions/gradle-4.0.2-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle/ gradle-4.0.2-bin.zip

sudo wget http://mirror.vorboss.net/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip
sudo mkdir /opt/maven
sudo unzip -d /opt/maven/ apache-maven-3.5.0-bin.zip

sudo cat > /etc/profile.d/oraclejdk.sh <<-EOF
export J2SDKDIR=/home/java/jdk1.8.0_131
export J2REDIR=/home/java/jdk1.8.0_131/jre
export JAVA_HOME=/home/java/jdk1.8.0_131
export DERBY_HOME=/home/java/jdk1.8.0_131/db
export PATH=$PATH:/home/java/jdk1.8.0_131/bin:/home/java/jdk1.8.0_131/db/bin:/home/java/jdk1.8.0_131/jre/bin:/opt/gradle/gradle-4.0.2/bin:/opt/maven/apache-maven-3.5.0/bin
EOF


sudo sh /etc/profile.d/oraclejdk.sh

echo "source to JDK path complete endof script"

sudo apt-get -y update
sudo apt-get -y upgrade