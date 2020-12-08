#!/bin/bash
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2020-12-04     || version: 1.0.0                 ::
# :: fecha de modificacion: 2020-12-08 || Quien modifica: Kevin Palacios ::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Variables globales

# definicion de funciones
func_encabezado(){
	echo '-------------------------------'
	echo '| EJECUTANDO NG DESDE CONSOLA |'
	echo '| (  ^o^)b        by Kevin    |'
	echo '-------------------------------'
}

func_mensaje(){
	echo "  Opciones permitidas: version, nuevo, generar"
	echo "  Uso recomendado: version"
	echo "                   nuevo [NombreApp]"
	echo "                   generar generar-component [NombreComponente]"
}

func_mensaje_generate(){
	echo "  Opciones permitidas dentro de generar: generar-appShell, generar-application, generar-class,"
	echo "                       generar-component, generar-directive, generar-enum, generar-guard,"
	echo "                       generar-interceptor, generar-interface, generar-library,"
	echo "                       generar-module, generar-pipe, generar-service, generar-serviceWorker"
	echo "                       generar-webWorker"
	echo "  Uso recomendado: generar generar-component [NombreComponente]"
}



func_NG(){
	ejecutable="$(pwd)/node_modules/.bin/ng"
	echo "Vefificando si existe $ejecutable"
	# Verificar si existe (-f archivo)
	if [ -f $ejecutable ];
	then
		echo "  Sí, sí existe."
		echo "Compilando <comando> $1"
		case $1 in
			"version")
				echo "    <comando> version"
				ejecutable="$ejecutable version"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			"nuevo")
				echo "    <comando> new $2"
				ejecutable="$ejecutable new $2"
				echo ">> $ejecutable <<"
				$ejecutable
			;;
			"generar")
				echo "    <comando> generate"
				func_NG_generate $ejecutable $2 $3
			;;	
			*)
				echo "    <comando> $2 --> -desconocida-"
				func_mensaje
			;;
		esac
		echo " ----------------------"
		echo "  d( ^^ )b Fin del programa"
	else
		echo " ----------------------"
		echo "  No, no existe"
		echo "  Revisa la ruta orz"
	fi
}

func_NG_generate(){
	echo "  Dentro del Comando  - generate -"
	ejecutable=$1
	case $2 in
		"generar-appShell")
			echo "    <comando> generate appShell $3"
			ejecutable="$ejecutable generate appShell $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;			
		"generar-application")
			echo "    <comando> generate application $3"
			ejecutable="$ejecutable generate application $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;    		
		"generar-class")
			echo "    <comando> generate class $3"
			ejecutable="$ejecutable generate class $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-component")
			echo "    <comando> generate component $3"
			ejecutable="$ejecutable generate component $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-directive")
			echo "    <comando> generate directive $3"
			ejecutable="$ejecutable generate directive $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;			 
		"generar-enum")
			echo "    <comando> generate enum $3"
			ejecutable="$ejecutable generate enum $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-guard")
			echo "    <comando> generate guard $3"
			ejecutable="$ejecutable generate guard $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-interceptor")
			echo "    <comando> generate interceptor $3"
			ejecutable="$ejecutable generate interceptor $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-interface")
			echo "    <comando> generate interface $3"
			ejecutable="$ejecutable generate interface $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-library")
			echo "    <comando> generate library $3"
			ejecutable="$ejecutable generate library $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-module")
			echo "    <comando> generate module $3"
			ejecutable="$ejecutable generate module $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-pipe")
			echo "    <comando> generate pipe $3"
			ejecutable="$ejecutable generate pipe $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-service")
			echo "    <comando> generate service $3"
			ejecutable="$ejecutable generate service $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-serviceWorker")
			echo "    <comando> generate serviceWorker $3"
			ejecutable="$ejecutable generate serviceWorker $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;
		"generar-webWorker")
			echo "    <comando> generate webWorker $3"
			ejecutable="$ejecutable generate webWorker $3"
			echo ">> $ejecutable <<"
			$ejecutable
		;;		
		*)
			echo "    <comando> $2 --> -desconocida-"
			func_mensaje_generate
		;;
	esac
}


func_encabezado
if [ $# -ge 1 ]; then
	func_NG $1 $2 $3
else
	echo " ----------------------"
	echo "  (/ ò_ó)/ Se debe ingresar al menos 1 parámetro"
	func_mensaje
fi
