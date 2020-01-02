@echo off

:: Define error macro
set "ifErr=set foundErr=1&(if errorlevel 0 if not errorlevel 1 set foundErr=)&if defined foundErr"

call :initColorPrint

call :echoColor 0A "[+] %DATE% - %TIME%:    Go to the script folder" /n
set directory_path=<Path to this project directory>
if exist %directory_path% (
  cd %directory_path%
) else (
  call :echoColor 0C "The path to the project directory doesn't exist" /n
  goto quit
)

call :echoColor 0A "[+] %DATE% - %TIME%:    Starting the script..." /n
python script.py %1 %2

call :echoColor 0A "[+] %DATE% - %TIME%:    Getting Git Username..." /n
set /p git_username=< secret.txt

call :echoColor 0A "[+] %DATE% - %TIME%:    Go to the new project folder" /n
cd %USERPROFILE%\projects\%1

call :echoColor 0A "[+] %DATE% - %TIME%:    Creating the project repository..." /n
echo # %1 >> README.md
echo # Add files to ignore there > .gitignore
git init
git add README.md
git add .gitignore
git commit -m "Initial commit"
%ifErr% (
  call :echoColor 0C "^^^^ ERROR ^^^^" /n
  goto quit
)

git remote add origin https://github.com/%git_username%/%1.git
git push -u origin master


call :echoColor 0A "[+] %DATE% - %TIME%:    Opening Atom..." /n
atom .
goto quit

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:echoColor Color  Str  [/n]
setlocal
set "str=%~2"
call :colorPrintVar %1 str %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined %~2 exit /b
setlocal enableDelayedExpansion
set "str=a%DEL%!%~2:\=a%DEL%\..\%DEL%%DEL%%DEL%!"
set "str=!str:/=a%DEL%/..\%DEL%%DEL%%DEL%!"
set "str=!str:"=\"!"
pushd "%temp%"
findstr /p /A:%1 "." "!str!\..\x" nul
if /i "%~3"=="/n" echo(
exit /b

:initColorPrint
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "DEL=%%a"
<nul >"%temp%\x" set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%.%DEL%"
exit /b

:cleanupColorPrint
del "%temp%\x"
exit /b

:quit
call :cleanupColorPrint
