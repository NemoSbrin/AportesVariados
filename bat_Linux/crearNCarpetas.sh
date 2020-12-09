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

func_aqui(){

}

func_enCarpeta(){

}

func_ejecucion(){
	echo $1
}

func_encabezado
if [ $# -ge 1 ]; then
	func_ejecucion $1 $2 $3
else
	echo " ----------------------"
	echo "  (/ ò_ó)/ Se debe ingresar al menos 1 parámetro"
	func_mensaje
fi
