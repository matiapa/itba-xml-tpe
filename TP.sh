#!/bin/bash

if [ $# -ne 1 ]
then
	echo "cantidad de argumentos invalida"
	exit 1
else
	java net.sf.saxon.Query years="$1" xml_query.xq > intermediate.xml
fi
