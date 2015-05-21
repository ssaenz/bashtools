#!/bin/bash

TOKEN_START="TOKEN_START";
TOKEN_END="TOKEN_END";

main () {

	if [ "$#" -lt 2 ]
		then
			showUsage;
			exit;
	fi
	extract $@;
}

function showUsage {
	echo "extractText.sh [origen] [destino]"
}

function extract () {
	echo "starting";
	sed -n '/'$TOKEN_START'/{:a;n;/'$TOKEN_END'/b;p;ba}' $1 >> $2
	echo "done"
}

main $@;

