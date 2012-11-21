@ECHO OFF

ECHO preDict setup and upgrade script
ECHO ================================
ECHO.
ECHO This script will setup or upgrade preDict on your machine.

PAUSE
ECHO.

ECHO Gathering information...

	REM enviornmental variables	
	SET data_path=%APPDATA%\Microsoft\Word\STARTUP\
	
	IF EXIST preDict.dotm GOTO :insCopy

	ECHO preDict file seems to be missing- unzipping on a local drive (i.e. C:\)
	GOTO insFail

:insCopy
ECHO Installing latest version...

	MKDIR %data_path% >NUL 2>NUL
	COPY "preDict.dotm" "%data_path%" >NUL 2>NUL

	REM report errors
	IF ERRORLEVEL = 1 GOTO insFail

	
:insPass

ECHO.
ECHO Setup completed successfully.
	PAUSE

	GOTO insEnd

:insFail

ECHO.
ECHO Setup failed, try again or attempt manually.
	PAUSE

	GOTO insEnd

:insEnd