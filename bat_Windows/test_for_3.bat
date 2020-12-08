@echo off
cls
set /a "cont=0" 
set ip=127.0.0.1
set array[%cont%]=%ip%
echo valor del array[%cont%]: 
call echo %%array[%cont%]%% 

for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (
	echo ---contador1= %cont%
    set array[%cont%] = %%a
	:continuar
	rem echo valor del array[%cont%]: | call echo %%array[%cont%]%% 
    rem set /a "cont+=1"
    rem call set /a cont=%cont%+1	
	goto aumento
	echo -contador2= %cont%
	pause>nul
	
) 
goto salir

:aumento
set /a cont=%cont%+1
pause>nul
goto continuar

:salir
echo saliendo...
pause>nul