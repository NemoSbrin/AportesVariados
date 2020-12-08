@echo off
cls
set direccionesIP=127.0.0.1;
echo %direccionesIP%
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (
    set ip=%%a;
    set direccionesIP=%direccionesIP%%ip%
	echo --%direccionesIP%
	
)
echo %direccionesIP%
:salir
echo saliendo...
pause>nul