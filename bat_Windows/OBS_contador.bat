@echo off
title Contador

set /a contador=1

:ciclo
if %contador% == 24 (goto salir) else goto continuar

:continuar
echo contador = %contador%
set /a contador=%contador% + 1
pause>nul
goto ciclo


:salir
echo saliendo
pause>nul
exit