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
		case $2 in
			ES3 | es3)
				echo "    en version $2"
				ejecutable="$ejecutable $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES5 | es5)
				echo "    en version $2"
				 #--target puede llevar 'es5' pero solo si se ejecuta directamente en la terminal
				ejecutable="$ejecutable --target es5 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES6 | es6)
				echo "    en version $2"
				ejecutable="$ejecutable --target es6 $1"
				echo ">> $ejecutable $1 <<"
				$ejecutable
			;;
			ES2015 | es2015)
				echo "    en version $2"
				ejecutable="$ejecutable --target es2015 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES2016 | es2016)
				echo "    en version $2"
				ejecutable="$ejecutable --target es2016 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES2017 | es2017)
				echo "    en version $2"				
				ejecutable="$ejecutable --target es2017 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES2018 | es2018)
				echo "    en version $2"
				ejecutable="$ejecutable --target es2018 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES2019 | es2019)
				echo "    en version $2"
				ejecutable="$ejecutable --target es2019 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ES2020 | es2020)
				echo "    en version $2"
				ejecutable="$ejecutable --target es2020 $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			ESNEXT | esnext)
				echo "    en version $2"
				ejecutable="$ejecutable --target esnext $1"
				echo ">> $ejecutable <<"
				$ejecutable
			;;			
			*)
				echo "    en version $2 --> -desconocida-"
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
