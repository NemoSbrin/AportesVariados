#!/bin/bash
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2020-12-09     || version: 1.0.0                 ::
# :: fecha de modificacion: 2021-01-21 || Quien modifica: Kevin Palacios ::
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

# Se usa el pwd.
func_creandoCarpetas(){
	echo "  <( '_')7 Verificando si hay espacios en blanco en ruta actual"
	nBlancos=$(func_hayEspacios)
	# echo " Hay espacios en blancos? $nBlancos"
	if [ $nBlancos -gt 1 ]; then
		echo "  (  '-')/ Se cambia el valor de pwd para aceptar espacios"
		rutaAUsar=$(func_reemplazandoEspacios $nBlancos)
	# rutaEspaciosAceptados=$? #Esto no funciona
		echo $rutaAUsar
	else
		rutaAUsar=`pwd`
		echo "  (  'o')b Todo bien"	
	fi
	# echo "    cd $1"
	# echo "  cantidad de capetas $2"
	echo "  Creando $1 carpetas en $rutaAUsar"
	cont=1
	#a futuro poner el nombre de la carpeta
	while [ $1 -ge $cont ]; do
		if [ $cont -le 9 ]; then
			# echo "    mkdir cap0$cont"
			mkdir cap0$cont
		else
			# echo "    mkdir cap$cont"
			mkdir cap$cont
		fi
		cont=$((cont + 1))
	done
}

# Se usa el pwd.
func_creandoCarpetas2(){
	echo "  Creando $2 carpetas en $1"
	cont=1
	#a futuro poner el nombre de la carpeta
	while [ $2 -ge $cont ]; do
		if [ $cont -le 9 ]; then
			# echo "    mkdir cap0$cont"
			mkdir cap0$cont
		else
			# echo "    mkdir cap$cont"
			mkdir cap$cont
		fi
		cont=$((cont + 1))
	done
}

# Se verifica que no haya espacios en pwd.
# No existe el return, lo que se hace es imprimir el valor que se va a enviar
func_hayEspacios(){
	# echo "  <( '_')7 Verificando ruta actual: `pwd`"
	index=$((0))
	# echo "index: $index"
	for v in `pwd`; do
		# echo "v: $v"
    	index=$((index + 1))
    	# echo "index dentro del for: $index"
	done
	# echo "cantidad de espacios en blanco: $index"
	echo $index
}

func_reemplazandoEspacios(){
	nuevaRuta=""
	index=$((0))
	# echo $1
	# echo $(($1-1))
	for v in `pwd`; do
		# echo "v: $v"
		if [ $index -eq 0 ];then
			nuevaRuta=$v
		fi
		if [ $index -ge 1 ] && [ $index -le $(($1-1)) ]; then
			nuevaRuta="$nuevaRuta\\ $v"
		fi		
    	index=$((index + 1))
    	# echo "nuevaRuta: $nuevaRuta"
    	# echo "index dentro del for: $index"
	done
	# echo "nueva Ruta obtenida: $nuevaRuta"
	echo $nuevaRuta
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
					func_creandoCarpetas $2					
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
						func_creandoCarpetas2 $2 $3
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
