#!/bin/bash
clear

# Variables globales

# definicion de funciones
func_encabezado(){
	echo '--------------------------------'
	echo '| EJECUTANDO TSC DESDE CONSOLA |'
	echo '| (  ^o^)b        by Kevin      '
	echo '--------------------------------'
}

func_TSC(){
	# ruta="$(pwd)/node_modules/.bin/"
	# echo "Vefificando si existe $ruta"
	# Verificar si existe (-d directorio)
	# if [ -d $ruta ];

	ejecutable="$(pwd)/node_modules/.bin/tsc"
	echo "Vefificando si existe $ejecutable"
	# Verificar si existe (-f archivo)
	if [ -f $ejecutable ];
	then
		echo "  Sí, sí existe."
		echo "Compilando $1 en version $2"
		#---------------
		# usar un case 
		#---------------
		if [ $2 = "ES3" ]; then
			ejecutable="$ejecutable -t 'ES3'"
		fi
		if [ $2 = "ES2017" ]; then
			ejecutable="$ejecutable -t 'ES2017'"
		fi
		echo $ejecutable
		#$ejecutable $1
		# $("$ejecutable  --pretty ") $1 #No funciono
		echo "  d( ^^ )b Ya esta listo"
	else
		echo "  No, no existe"
		echo "  orz Revisa la ruta"
	fi
	
}

func_encabezado
if [ $# -eq 2 ]; then
	func_TSC $1 $2
else
	echo "  (/ ò_ó)/ No puso ni nombre del archivo o target"
	echo "  target permitidos: ES3 (default), ES5, ES2015"
	echo "                     ES2016, ES2017, ES2018,"
	echo "                     ES2019, ES2020, or ESNEXT"
	echo "  target recomendado: ES2017"
fi
