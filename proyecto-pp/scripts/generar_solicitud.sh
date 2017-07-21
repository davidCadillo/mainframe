#!/bin/bash

dir=/root/proyecto/inputs

if [ ! -z "$(ls -A $dir)" ]; then
	rm -rf $dir/*
fi
	ssh root@10.0.0.4 '/root/proyecto/scripts/enviar.sh' $1 $2

