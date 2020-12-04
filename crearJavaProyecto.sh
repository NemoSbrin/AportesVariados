#!/bin/bash
clear

# Variables globales
classpath=""

# definicion de funciones
func_encabezado(){
	echo '-----------------------------------'
	echo '| CREANDO UN JAVA PROYECT SENCILLO|'
	echo '| (  ^o^)b        by Me            '
	echo '-----------------------------------'
	echo
}

func_creandoManifestoSencillo(){
	echo "Manifest-Version: 1.0" > $1
	echo "Main-Class: [nombre_de_la_clase]" >> $1
}

func_carpetas(){
	echo '-------------------------------'
	echo '| Creando carpetas y archivos |'
	echo '-------------------------------'
	echo "-$1"
	mkdir $1
	echo " -bin"
	mkdir $1/bin
	echo " -src"
	mkdir $1/src
	echo " -META-INF"
	mkdir $1/META-INF
	echo "   Manifest.mf"
	func_creandoManifestoSencillo $1/META-INF/Manifest.mf
}

func_creandoArchivoClases(){
	cd src
	ls -R > ../list_class
	cd ..
	cat list_class
}

# Empieza el programa
func_encabezado
if [ $# -eq 1 ]; then
	func_carpetas $1
else
	echo "No puso nombre al proyecto"
fi
# fun_carpetas
# fun_creandoArchivoClases
