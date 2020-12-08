@echo off
cls
echo for
set /a seConsultoIP=0
set /a seConsultoMascara=0
set /a seConsultoGateway=0
set /a saliendo=0
set array[%cont%] = 127.0.0.1
call echo %%array[%cont%]%% 
:continuar
set /a cont=0
set ip=127.0.0.1
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (
::    echo cont: %cont% "|" seConsultoIP: %seConsultoIP% "|" seConsultoMascara: %seConsultoMascara% "|" seConsultoGateway: %seConsultoGateway% "|" saliendo: %saliendo%
	echo cont: %cont%
	echo seConsultoIP: %seConsultoIP% 
	set ip=%%a
	if %cont% equ 1 AND %seConsultoIP% equ 0 (goto la_ip_es)
	if %cont% equ 2 AND %seConsultoMascara% equ 0 (goto la_mascara_es)
	::if %seConsultoGateway% equ 1 (goto el_gateway_es)
	::if %saliendo% equ 1 (goto salir)
	pause>nul
)

:la_ip_es
echo seConsultoIP: %seConsultoIP% 
echo la ip es: %ip%
set /a seConsultoIP=%seConsultoIP%+1
set array[%cont%]=%ip%
echo seConsultoIP: %seConsultoIP%
call echo %%array[%cont%]%% 
pause>nul
goto continuar

:la_mascara_es
echo seConsultoMascara: %seConsultoMascara%
echo la mascara es: %ip%
set /a seConsultoMascara=%seConsultoMascara%+1
set array[%cont%]=%ip%
echo seConsultoMascara: %seConsultoMascara%
call echo %%array[%cont%]%% 
pause>nul
goto continuar

:el_gateway_es
echo seConsultoGateway: %seConsultoGateway%
echo el gateway es: %ip%
set /a seConsultoGateway=%seConsultoGateway%+1
echo seConsultoGateway: %seConsultoGateway%
pause>nul
goto continuar

:salir
echo saliendo: %saliendo%
echo saliendo...
pause>nul