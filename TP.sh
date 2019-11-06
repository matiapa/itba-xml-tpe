#!/bin/bash

if [ $# -ne 1 ]
then
	echo "cantidad de argumentos invalida"
	exit 1
else
Java net.sf.saxon.Query xml_query.xq>intermediate.xml years="$1"

fi
