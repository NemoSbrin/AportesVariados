#!/bin/bash
clear

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
		echo "Compilando <comando> $1 [opcion(es)] $2"
		case $1 in
			"version")
				echo "    <comando> version"
				ejecutable="$ejecutable version"
				echo ">> $ejecutable <<"
				#$ejecutable
			;;
			"nuevo")
				echo "    <comando> new $2"
				ejecutable="$ejecutable new $2"
				echo ">> $ejecutable <<"
				#$ejecutable
			;;
			"generar")
				echo "    <comando> generate"
				echo ">> $ejecutable <<"
				func_NG_generate $ejecutable $3
			;;	
			*)
				echo "    <comando> $2 --> -desconocida-"
				func_mensaje
			;;
		esac
		echo "  d( ^^ )b Fin del programa"
	else
		echo "  No, no existe"
		echo "  orz Revisa la ruta"
	fi
}

func_NG_generate(){
	ejecutable=$1
	case $2 in
		"generar-appShell")
			echo "    <comando> generate appShell $2"
			ejecutable="$ejecutable generate appShell $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;			
		"generar-application")
			echo "    <comando> generate application $2"
			ejecutable="$ejecutable generate application $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;    		
		"generar-class")
			echo "    <comando> generate class $2"
			ejecutable="$ejecutable generate class $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-component")
			echo "    <comando> generate component $2"
			ejecutable="$ejecutable generate component $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-directive")
			echo "    <comando> generate directive $2"
			ejecutable="$ejecutable generate directive $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;			 
		"generar-enum")
			echo "    <comando> generate enum $2"
			ejecutable="$ejecutable generate enum $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-guard")
			echo "    <comando> generate guard $2"
			ejecutable="$ejecutable generate guard $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-interceptor")
			echo "    <comando> generate interceptor $2"
			ejecutable="$ejecutable generate interceptor $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-interface")
			echo "    <comando> generate interface $2"
			ejecutable="$ejecutable generate interface $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-library")
			echo "    <comando> generate library $2"
			ejecutable="$ejecutable generate library $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-module")
			echo "    <comando> generate module $2"
			ejecutable="$ejecutable generate module $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-pipe")
			echo "    <comando> generate pipe $2"
			ejecutable="$ejecutable generate pipe $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-service")
			echo "    <comando> generate service $2"
			ejecutable="$ejecutable generate service $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-serviceWorker")
			echo "    <comando> generate serviceWorker $2"
			ejecutable="$ejecutable generate serviceWorker $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;
		"generar-webWorker")
			echo "    <comando> generate webWorker $2"
			ejecutable="$ejecutable generate webWorker $2"
			echo ">> $ejecutable <<"
			#$ejecutable
		;;		
		*)
			echo "    <comando> $2 --> -desconocida-"
			func_mensaje
		;;
	esac
}


func_encabezado
if [ $# -ge 1 ]; then
	func_NG $#
else
	echo "  (/ ò_ó)/ Se debe ingresar al menos 1 parámetro"
	func_mensaje
fi
