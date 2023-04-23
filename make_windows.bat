@echo off
:help
if "%~1"=="" (
	echo [ -INFO- ] Please specify either 'build', 'delete', or 'clear' when running this command.
	echo ^|          build  - ^(re^)build the binaries
    echo ^|          delete - delete the previous binaries
    echo ^|          clear  - remove the 'bin' folder
	echo [ -DONE- ] Exit now.
	exit /b 1
) else if "%~1"=="build" (
	echo [ START: ] Building the binaries now ...
    echo [ -INFO- ] Please build hpcmgr with GNU/Linux, not Windows.
	mkdir .\build > nul 2>&1
	echo [ -INFO- ] Deleting previously built binaries ^(if exist^)...
	del /s /q /f .\build\*
	echo [ -INFO- ] Bulding new binaries with the gcc ...
	gcc .\hpcopr\*.c -Wall -o .\build\hpcopr.exe
	gcc .\hpcopr\general_funcs.c -shared -fPIC -o .\installer\libgfuncs.so
	gcc .\installer\installer.c .\installer\libgfuncs.so -Wall -o .\build\installer.exe
	move /y .\installer\libgfuncs.so .\build\libgfuncs.so
	gcc .\now-crypto\now-crypto.c -Wall -o .\build\now-crypto.exe
) else if "%~1"=="delete" (
	echo [ START: ] Deleting the binaries now ...
	del /s /q /f .\build\*
) else if "%~1"=="clear" (
	echo [ START: ] Deleting the binaries now ...
	del /s /q /f .\build\*
	echo [ START: ] Removing the bin folder now ...
	rd /s /q .\build
) else (
	echo [ -INFO- ] Please specify either 'build', 'delete', or 'clear' when running this command.
	echo ^|          build  - ^(re^)build the binaries
    echo ^|          delete - delete the previous binaries
    echo ^|          clear  - remove the 'bin' folder
	echo [ -DONE- ] Exit now.
	exit /b 1
)
echo [ -DONE- ] Please check the console output for building results.
exit /b 1