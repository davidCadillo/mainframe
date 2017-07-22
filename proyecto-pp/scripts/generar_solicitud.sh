#!/bin/bash

root=/root/proyecto

if [ ! -z "$(ls -A $dir)" ]; then
	rm -rf $dir/inputs/*
fi
	ssh root@10.0.0.4 '/root/proyecto/scripts/enviar.sh' $1 $2
	rm -rf $dir/outputs/*
	Rscript ./reportes/alcoholismo.R
	Rscript ./reportes/tabaquismo.R
	scp /root/proyecto/outputs/* root@10.0.0.6:/root/proyecto/inputs


