@echo off
cls
echo for
set /a cont=0
set /a saberIP=0
set /a saberMascara=0
set /a saberGateway=0
set /a saliendo=0
set array[%cont%] = 127.0.0.1
echo !array[%%cont]! 
:continuar
set ip=127.0.0.1
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (
    echo cont: %cont% | saberIP: %saberIP% | saberMascara: %saberMascara% saberGateway: %saberGateway% | saliendo: %saliendo%
	set ip=%%a
	if %cont% equ 1 AND %saberIP% equ 1 (goto la_ip_es)
	if %cont% equ 2 AND %saberMascara% equ 1 (goto la_mascara_es)
	::if %saberGateway% equ 1 (goto el_gateway_es)
	::if %saliendo% equ 1 (goto salir)
	pause>nul
)

:la_ip_es
echo la ip es: %ip%
set /a saberIP=%saberIP%+1
pause>nul
goto continuar

:la_mascara_es
echo la mascara es: %ip%
set /a saberMascara=%saberMascara%+1
set /a saberGateway=%saberGateway%+1
pause>nul
goto continuar

:el_gateway_es
echo el gateway es: %ip%
set /a saberGateway=%saberGateway%+1
set /a saliendo=%saliendo%+1
pause>nul
goto continuar

:salir
echo saliendo...
pause>nul