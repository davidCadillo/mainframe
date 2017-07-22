#!/bin/bash

	root=/root/proyecto
	if [ -n "$(ls -A $dir)" ]; then
		rm -rf $dir/inputs/*
	fi
	ssh root@10.0.0.4 '/root/proyecto/scripts/enviar.sh' $1 $2
	rm -rf $dir/outputs/*

	scripts=$(find /root/proyecto/scripts/reportes/* -type f -name "*.R" -printf "%f\n")
	for script in $scripts
	do
	        Rscript /root/proyecto/scripts/reportes/$script
	done

	scp /root/proyecto/outputs/* root@10.0.0.6:/root/proyecto/inputs


