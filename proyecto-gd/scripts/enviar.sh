#!/bin/bash

Rscript /root/proyecto/scripts/start.R $1 $2

scp /root/proyecto/output/* root@10.0.0.5:/root/proyecto/inputs

rm -rf /root/proyecto/output/*
