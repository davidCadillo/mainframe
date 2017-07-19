#!/bin/bash

echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
apt-get install r-base r-base-dev
apt-get install r-cran-rjava
export _JAVA_OPTIONS="-Xss2560k -Xmx2g"

R()
install.packages("wakefield")
install.packages("xlsxjars")
install.pacakages("xlsx")
