#!/bin/bash
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2020-12-09     || version: 1.0.0                 ::
# :: fecha de modificacion: 2020-12-09 || Quien modifica: Kevin Palacios ::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Variables globales

# definicion de funciones
func_encabezado(){
	echo '------------------------------------'
	echo '| CREANDO N CARPETAS DESDE CONSOLA |'
	echo '| (  ^o^)b        by Kevin         |'
	echo '------------------------------------'
}

func_mensaje(){
	echo "  Opciones permitidas: --aqui, --enCarpeta"
	echo "  Uso recomendado: --aqui [#deCarpetas]"
	echo "                   --enCarpeta [pathCarpeta] [#deCarpetas]"
}

func_mensaje_NumeroCarpetaVacio(){
	echo "  (  '_')/ Número de carpetas está vacio"
}

func_mensaje_PathDeCarpetaVacio(){
	echo "  (  '_')/ El path de carpeta está vacio"
}

func_creandoCarpetas(){
	echo "cd $1"
	echo "cantidad de capetas $2"
	cont=1
	#a futuro poner el nombre de la carpeta
	while [ $2 -ge $cont ]; do
		if [ $cont -le 9 ]; then
			echo "mkdir cap0$cont"
		else
			echo "mkdir cap$cont"
		fi
		cont=$((cont + 1))
	done
}

func_ejecucion(){
	echo "datos $1 $2 $3"
	case $1 in
		"--aqui")
			if [ "$2" = "" ]; then
				func_mensaje_NumeroCarpetaVacio
			else
				if [ $2 -eq 0 ]; then
					func_mensaje_NumeroCarpetaVacio
				else
					func_creandoCarpetas `pwd` $2
				fi
			fi
		;;
		"--enCarpeta")
			if [ "$2" = "" ]; then
				func_mensaje_PathDeCarpetaVacio
			else
				if [ "$3" = "" ]; then
					func_mensaje_NumeroCarpetaVacio
				else
					if [ $3 -eq 0 ]; then
						func_mensaje_NumeroCarpetaVacio
					else
						func_creandoCarpetas $2 $3
					fi
				fi
			fi
		;;
		*)
			echo "  - Opcion No Reconocida -"
			func_mensaje
		;;
	esac
	echo " ----------------------"
	echo "  d( ^^ )b Fin del programa"
}

func_encabezado
if [ $# -ge 1 ]; then
	func_ejecucion $1 $2 $3
else
	echo " ----------------------"
	echo "  (/ ò_ó)/ Se debe ingresar al menos 1 parámetro"
	func_mensaje
fi
