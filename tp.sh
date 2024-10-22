#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: ./tp.sh 'historical_years'"
	exit 1
else
	java net.sf.saxon.Query years="$1" xml_query.xq > intermediate.xml
	java net.sf.saxon.Transform intermediate.xml json_convert.xsl > output.json
fi
