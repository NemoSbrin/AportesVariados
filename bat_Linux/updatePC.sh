#!/bin/sh
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2023-09-23     || version: 1.1.0                 ::
# :: fecha de modificacion: 2023-09-23 || Quien modifica: Kevin Palacios ::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# definicion de funciones
func_header(){
	echo ' ----------------------------------- '
	echo '|    EJECUTANDO LA ACTUALIZACION    |'
	echo '|    (  ^o^)b        by Kevin       |'
	echo ' ----------------------------------- '
}

func_log(){
    local NAME="updatePC-$(date +"%Y%m%d-%H%M%S").log"
    echo "creando log en $(pwd)" > $NAME
    echo "$NAME"
}

func_updateApt(){
    echo ' -----------------------------------'
    echo "|    Actualizando programas con:    |"
    echo "|                APT                |"
    echo '-------------------------------------'
    sudo apt-get update
    echo ' ---------------------------------- '
    echo "| Se lista los programas todos los |"
    echo "| instalados                       |"
    echo '------------------------------------'
    sudo apt list --installed
    echo ' ---------------------------------- '
    echo "| Se lista las actualizaciones a   |"
    echo "| instalar                         |"
    echo '------------------------------------'
    sudo apt list --upgradeable
    echo ' ---------------------------------- '
    echo "| Instalando las actualizaciones   |"
    echo '------------------------------------'
    sudo apt upgrade -y
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
    flatpak uninstall --unused
}

# ejecucion del programa
log=$(func_log)
func_header >> $log
func_updateApt >> $log
func_updateFlatpak >> $log

