@echo off
color 0A

echo [+] %DATE% - %TIME%:    Go to the script folder
set directory_path=<Path of this project directory>
if exist %directory_path% (
  cd %directory_path%
) else (
  echo The path to the project directory doesn't exist
  goto quit
)

echo [+] %DATE% - %TIME%:    Starting the script...
python script.py %1 %2

echo [+] %DATE% - %TIME%:    Getting Git Username...
set /p git_username=< secret.txt

echo [+] %DATE% - %TIME%:    Go to the new project folder
cd %USERPROFILE%\projects\%1

echo [+] %DATE% - %TIME%:    Creating the project repository...
echo # %1 >> README.md
echo # Add files to ignore there > .gitignore
git init
git add README.md
git add .gitignore
git commit -m "Initial commit"
git remote add origin https://github.com/%git_username%/%1.git
git push -u origin master

echo [+] %DATE% - %TIME%:    Opening Atom...
color 0F
atom .

:quit
color 0F
