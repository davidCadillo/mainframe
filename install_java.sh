#!/bin/bash
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
update-alternatives --config java
update-alternatives --config javac