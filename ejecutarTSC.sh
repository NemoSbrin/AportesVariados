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

func_mensajeTargets(){
	echo "  target permitidos: ES3 (default), ES5, ES6"
	echo "                     ES2015, ES2016, ES2017,"
	echo "                     ES2018, ES2019, ES2020,"
	echo "                     or ESNEXT"
	echo "  target recomendado: ES2017"
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
		echo "Compilando $1"
		#---------------
		# usar un case 
		# #---------------
		# if [ $2 = "ES3" ]; then
		# 	ejecutable="$ejecutable -t 'ES3'"
		# fi
		# if [ $2 = "ES2017" ]; then
		# 	ejecutable="$ejecutable -t 'es2017'"
		# fi
		# echo "$ejecutable $1"
		#$ejecutable $1
		# $("$ejecutable  --pretty ") $1 #No funciono
		case $2 in
			ES3)
				#echo -n "ES3"
				echo "           en version $2"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			ES5)
				#echo -n "ES5"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es5'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			ES6)
				#echo -n "ES5"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es6'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2015")
				# echo -n "ES2015"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2015'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2016")
				# echo -n "ES2016"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2016'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2017")
				# echo -n "ES2017"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2017'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2018")
				# echo -n "ES2018"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2018'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2019")
				# echo -n "ES2019"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2019'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			"ES2020")
				# echo -n "ES2020"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'es2020'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;
			ESNEXT)
				# echo -n "ESNEXT"
				echo "           en version $2"
				ejecutable="$ejecutable --target 'esnext'"
				echo "$ejecutable $1"
				$ejecutable $1
			;;			
			*)
				echo "            en version -desconocida-"
				func_mensajeTargets
			;;
		esac
		echo "  d( ^^ )b Fin del programa"
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
	func_mensajeTargets
fi
