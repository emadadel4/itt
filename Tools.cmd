@ECHO off
cls
:start

@echo off
echo "+========================================================+";
echo "| _____ __  __    _    ____       _    ____  _____ _     |";
echo "|| ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |    |";
echo "||  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |    |";
echo "|| |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___ |";
echo "||_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____||";
echo "+========================================================+";

ECHO.
ECHO 1. Chris Titus Tech's Windows Utility
ECHO 2. Microsoft Activation Scripts
ECHO 3. Emad Adel github page
ECHO 4. Telgram [emadadel4]

set choice=
set /p choice=Type the number to run script.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto hello
if '%choice%'=='2' goto bye
if '%choice%'=='3' goto test
if '%choice%'=='4' goto test4

ECHO "%choice%" is not valid, try again
ECHO.

goto start
:hello
ECHO Chris Titus Tech's Windows Utility
powershell -Command "& {iwr -useb https://christitus.com/win | iex}"
goto end
:bye
ECHO Microsoft Activation Scripts [Win 10-8]
powershell -Command "& {irm https://massgrave.dev/get | iex}"
goto end
:test
ECHO Emad Adel github page
start "" https://github.com/emadadel4
goto end
:test4
ECHO  Telgram Emad adel
start "" https://t.me/emadadel4
goto end
:end
cls
goto start