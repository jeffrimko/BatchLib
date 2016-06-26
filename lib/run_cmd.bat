:: Provides the RunCmd function.
:: **Dependencies**:
:: None.

::=============================================================::
:: DEVELOPED 2013, REVISED 2016, Jeff Rimko.                   ::
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

call:RunCmd "Show directory contents" dir
call:RunCmd "Show current time" time /T
pause
exit /b 0

::-------------------------------------------------------------::
:: Function to run a command.
:: **Params**:
::  - 1 - Description of command.
::  - 2+ - Command to execute.
:: **Attention**:
:: Quotes can be used around the first parameter but do not put them around the
:: remaining params.  Quotes may be included in the remaining params if they
:: are needed for the command.
:: **Example**:
:: call run_cmd.bat "Show directory contents" ls
::-------------------------------------------------------------::
:RunCmd
echo %~1:
shift
set CMD=%1
shift
:shift_next
if [%1] neq [] (
    set CMD=%CMD% %1
    shift
    goto:shift_next
)
echo  ^$ %CMD%
echo /-------
%CMD%
echo \-------
echo.
goto:eof
