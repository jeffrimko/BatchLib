:: Example of using batch library.
:: **Dependencies**: None

::=============================================================::
:: DEVELOPED 2014, REVISED 2014, Jeff Rimko.                   ::
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
:: Path to the run_cmd script.
set BAT_RUNCMD=..\lib\run_cmd.bat

::=============================================================::
:: SECTION: Main Body                                          ::
::=============================================================::

:: Check for Python.
call %BAT_CHKDEP%^
    call:ChkDepQwk^
    ls --help
echo.

if 1 == %DEP_OK% (
    call %BAT_RUNCMD%^
        call:RunCmd^
        "Posix list command"^
        ls
) else (
    call %BAT_RUNCMD%^
        call:RunCmd^
        "Windows directory command"^
        dir
)

pause
exit /b 0
