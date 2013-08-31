:: Example of using the `chk_dep.bat` file.
:: **Dependencies**: None

::=============================================================::
:: COPYRIGHT 2013, REVISED 2013, Jeff Rimko.                   ::
::=============================================================::

::=============================================================::
:: SECTION: Environment Setup                                  ::
::=============================================================::

@set TITLE=%~n0 "%~dp0"
@cd /d %~dp0 && echo off && title %TITLE%

::=============================================================::
:: SECTION: Global Definitions                                 ::
::=============================================================::

:: Path to the run_bat script.
set BAT_RUNBAT=..\lib\run_bat.bat

::=============================================================::
:: SECTION: Main Body                                          ::
::=============================================================::

call %BAT_RUNBAT% call:RunBat "Run example script..." chkdep_python.bat

pause
exit /b 0
