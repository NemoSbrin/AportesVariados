@echo off
cls
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                autor:   Kevin S. Palacios C.                        ::
::                                                                     ::
:: fecha de creacion: 2020-02-18     || version: 1.4.0                 ::
:: fecha de modificacion: 2020-02-19 || Quien modifica: Kevin Palacios ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::-- codigo de pruebas y utilitarios -------------------------------------------
:: Buscando direcciones IP validas
::for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (set mi_IP=%%a)
::for /f usebackq tokens=2 delims=: %%a in (ipconfig|FINDSTR "Dirección IPv4")do(echo %%a)
::for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^|FINDSTR *IPv4* ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (set mi_IP=%%a)
::------------------------------------------------------------------------------
set mi_IP=127.0.0.1
:: Buscando direccion IPv4
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (set mi_IP=%%a)

:: En caso de que falle el for
if "%mi_IP%" == "127.0.0.1" goto falloAlgo else continuar

:continuar
:: Mostrando la direccion encontrada al usuario
echo Mi direccion IP es: %mi_IP%
goto salir

:falloAlgo
:: Fallo el for de busqueda
echo.
echo Mi direccion IP es:
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (echo=%%a)
goto salir

:salir
echo.
echo Pulse cualquier tecla para salir...
pause>nul
::exit