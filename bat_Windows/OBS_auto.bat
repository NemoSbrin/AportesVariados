:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Version 0.0.1                                                     ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Este es un bat con el objetivo de iniciar el programa OBS Studio  ::
:: y ejecutar comandos dependiendo a ciertos valores iniciales       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Inicio del batch
echo.
:: Creacion e inicializacion de variables
:: v1 es para tiempo y escenas
set /a v1=4
:: $1=1 tiempos de 23h59m
:: $2=0 escena por default
:: Se ubica la posicion del ejecutable.
cd "C:\Program Files\obs-studio\bin\64bit\"
:: Video de 23h59m y graba escenario1
IF /I %v1% EQU 1 (
:: Se inicia OBS con un perfil (start de obs with your profile)
	echo "1"
	goto fin
)ELSE(
:: Video de 23h59m y graba escenario2
	IF /I %v1% EQU 2 (
:: Se inicia OBS con un perfil (start de obs with your profile)
		echo "2"
		goto fin
	)ELSE(
:: Video de 23h59m y graba escenario3
		IF /I %v1% EQU 3 (
:: Se inicia OBS con un perfil (start de obs with your profile)
			echo "3"
			goto fin
		)ELSE(
:: Video de 23h59m y graba escenario4
			IF /I %v1% EQU 4 (
:: Se inicia OBS con un perfil (start de obs with your profile)
				echo "4"
				goto fin
			)
		)
	)
)
:fin
pause
REM start obs64.exe --multi --profile "Testeo" --startrecording --minimize-to-tray
REM TIMEOUT 86399
TIMEOUT 15
REM kill the process
REM taskkill /f /t /im obs64.exe
exit