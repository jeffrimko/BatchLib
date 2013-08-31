:: Provides the ChkDep function.
:: **Dependencies**:
:: None

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

call:ChkDep ^
    "Python" ^
    "Python language interpreter." ^
    "www.python.org" ^
    "2.6.6" ^
    python -V

pause
exit /b 0

::=============================================================::
:: SECTION: Function Definitions                               ::
::=============================================================::

::-------------------------------------------------------------::
:: Checks if a dependency is available.
:: **Params**:
::  - 1 - Name of dependency.
::  - 2 - Description of dependency.
::  - 3 - Reference website or where to obtain info.
::  - 4 - Recommended version.
::  - 5+ - Non-blocking command to check if installed; usually version display
::         or help.
::
:: **Attention**:
:: Do not use quotes around the non-blocking command.
:: Quotes may be included in the remaining params if they are needed for the
:: non-blocking call.
::
:: **Preconditions**:
:: The global variable DEP_OK should be set to 1 before the first call to this
:: function.
::
:: **Postconditions**:
:: The global variable DEP_OK will be set to 0 if a dependency check fails.
:: This variable is not set back to 1 by this function, it may be explicitly
:: set outside the function
::
:: **Example**:
:: call::ChkDep^
::     "Utility"^
::     "Does something."^
::     "www.website.com"^
::     "1.2.3"^
::     utility -h
:: call::ChkDep^
::     "Utility"^
::     "Does something."^
::     "www.website.com"^
::     "1.2.3"^
::     utility -c "non-blocking cmd"
::-------------------------------------------------------------::
:ChkDep
echo Checking dependency for %~1...
shift
echo     %~1
shift
echo     Reference: %~1
shift
echo     Recommended version: %~1
shift
echo     --------
set CMD=%1
shift
:shift_next
if [%1] neq [] (
    set CMD=%CMD% %1
    shift
    goto:shift_next
)
%CMD% > NUL 2>&1
if %ERRORLEVEL% neq 0 (
    echo     NOT FOUND!
    set DEP_OK=0
) else (
    echo     OK.
)
echo.
goto:eof
