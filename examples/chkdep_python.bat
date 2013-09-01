:: Example of using the `chk_dep.bat` file.
:: **Dependencies**: None

::=============================================================::
:: DEVELOPED 2013, REVISED 2013, Jeff Rimko.                   ::
::=============================================================::

::=============================================================::
:: SECTION: Environment Setup                                  ::
::=============================================================::

@set TITLE=%~n0 "%~dp0"
@cd /d %~dp0 && echo off && title %TITLE%

::=============================================================::
:: SECTION: Global Definitions                                 ::
::=============================================================::

:: Set the dependency OK flag.
set DEP_OK=1

:: Path to the chk_dep script.
set BAT_CHKDEP=..\lib\chk_dep.bat

::=============================================================::
:: SECTION: Main Body                                          ::
::=============================================================::

:: Check for Python.
call %BAT_CHKDEP%^
    call:ChkDep^
    "Python"^
    "Python language interpreter."^
    "www.python.org"^
    "2.6.6"^
    python -V
echo.
echo Global variable DEP_OK = %DEP_OK%
echo.

:: Check for Python.
call %BAT_CHKDEP%^
    call:ChkDepVer^
    "Python"^
    "Python language interpreter."^
    "www.python.org"^
    "2.6.6"^
    python -V
echo.
echo Global variable DEP_OK = %DEP_OK%
echo.

pause
exit /b 0
