@echo off
title Inicia OBS

set /a contador=0
::Toma variable de ingreso
set /a limite=%1

::Inicia bucle y manda a los metodos
:ciclo
if %contador% == %limite% (goto salir) else goto continuar

::Bloque de verdad del if
:continuar
REM cd "C:\Program Files\obs-studio\bin\64bit\"
REM start obs64.exe --multi --profile "Testeo" --startrecording --minimize-to-tray
REM TIMEOUT 5
::::kill the process
REM taskkill /f /t /im obs64.exe
set /a contador=%contador% + 1
echo contador act = %contador%
pause>nul
goto ciclo

::Bloque de verificacion de tiempo
:tiempo
if %1 


::Bloque de falso del if
:salir
echo saliendo
pause>nul
REM exit