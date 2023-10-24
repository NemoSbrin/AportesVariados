#!/bin/sh
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2023-09-23     || version: 1.3.1                 ::
# :: fecha de modificacion: 2023-10-24 || Quien modifica: Kevin Palacios ::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# definicion de variables globales
DIR=".updatePC/"
NAME="updatePC-$(date +"%Y%m%d-%H%M%S").log"

# definicion de funciones
func_header(){
	echo ' ----------------------------------- '
	echo '|    EJECUTANDO LA ACTUALIZACION    |'
	echo '|    (  ^o^)b        by Kevin       |'
	echo ' ----------------------------------- '
}

func_log(){
    cd ~
    local band=0
    if [ ! -d "$DIR" ]; then
    # Take action if $DIR exists. #
        mkdir $DIR
        cd $DIR
        echo "Creando carpeta ${DIR}..." > $NAME
        echo "  Se creo log en $(pwd)" >> $NAME
        band=1
        # return
        echo "$band"
    else
        cd $DIR
        echo "Se creo log en $(pwd)" > $NAME
        band=2
        # return
        echo "$band"
    fi
}

func_updateApt(){
    echo ' -----------------------------------'
    echo "|    Actualizando programas con:    |"
    echo "|                APT                |"
    echo '-------------------------------------'
    sudo apt-get update
    # TODO: poner con parametros para habilitar esta opcion
    #echo ' ---------------------------------- '
    #echo "| Se lista los programas todos los |"
    #echo "| instalados                       |"
    #echo '------------------------------------'
    #sudo apt list --installed
    echo ' ---------------------------------- '
    echo "| Se lista las actualizaciones a   |"
    echo "| instalar                         |"
    echo '------------------------------------'
    sudo apt list --upgradeable
    echo ' ---------------------------------- '
    echo "| Instalando las actualizaciones   |"
    echo '------------------------------------'
    sudo apt-get upgrade -y
    echo ' ---------------------------------- '
    echo "| Limpiando actualizaciones        |"
    echo "| obsoletas o antiguas             |"
    echo '------------------------------------'
    sudo apt-get autoclean autoremove
}

func_updateFlatpak(){
    echo ' -----------------------------------'
    echo "|    Actualizando programas con:    |"
    echo "|              FLATPAK              |"
    echo '-------------------------------------'
    echo ' ---------------------------------- '
    echo "| Se lista las actualizaciones a   |"
    echo "| instalar                         |"
    echo '------------------------------------'
    flatpak list --app
    echo ' ---------------------------------- '
    echo "| Instalando las actualizaciones   |"
    echo '------------------------------------'
    flatpak update -y
    echo ' ---------------------------------- '
    echo "| Limpiando actualizaciones        |"
    echo "| obsoletas o antiguas             |"
    echo '------------------------------------'
    flatpak uninstall --unused -y
}

# ejecucion del programa
log=$(func_log)
echo $log
if [ $log -ge 1 ]; then
    cd ~
    cd $DIR/
    pwd
fi
#func_log
func_header >> $NAME
func_updateApt >> $NAME
func_updateFlatpak >> $NAME
# TODO: Verificar que lector tiene o configurar un archivo config
nano $NAME

