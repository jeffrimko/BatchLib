:: Provides the RunBat function.
:: **Dependencies**:
:: None.

::=============================================================::
:: DEVELOPED 2013, REVISED 2013, Jeff Rimko.                   ::
::=============================================================::

::=============================================================::
:: SECTION: Main Body                                          ::
::=============================================================::

:: Set up environment.
@echo off

:: Call function if arguments given.
if not "" neq %* do (
    call %*
    exit /b %ERRORLEVEL%
)

call:RunBat "Run example script..." chk_dep.bat
pause
exit /b 0

::=============================================================::
:: SECTION: Function Definitions                               ::
::=============================================================::

::-------------------------------------------------------------::
:: Function to launch a batch file in a separate window and waits for it to
:: finish.
:: **Params**:
::  - 1 - Description of batch file.
::  - 2+ - Path to batch file.
:: **Attention**:
:: Quotes can be used around the first parameter but do not put them around the
:: remaining params.
::-------------------------------------------------------------::
:RunBat
echo %~1
shift
set BAT=%1
shift
:shift_next
if [%1] neq [] (
    set BAT=%BAT% %1
    shift
    goto:shift_next
)
start /wait cmd /c call %BAT%
if %ERRORLEVEL% neq 0 (
    echo     FAILED!
) else (
    echo     DONE.
)
goto:eof
