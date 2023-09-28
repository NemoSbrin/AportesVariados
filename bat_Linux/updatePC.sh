#!/bin/sh
clear

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::                autor:   Kevin S. Palacios C.                        ::
# ::                                                                     ::
# :: fecha de creacion: 2023-09-23     || version: 1.0.0                 ::
# :: fecha de modificacion: 2023-09-23 || Quien modifica: Kevin Palacios ::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


echo "-->> Se actualiza los programas con apt <<--"
sudo apt-get update
echo "--> Programas a actualizar <--"
sudo apt list --upgradeable
echo "--> Instalando actualizaciones <--"
sudo apt-get upgrade -y
echo "--> Limpiando instalaciones <--"
sudo apt autoclean autoremove
echo "-->> Actualizando programas con flatpak <<--"
echo "--> Listando programas con flatpak <--"
flatpak list --app
flatpak update -y
echo "--> Removiendo paquetes <--"
flatpak uninstall --unused