# Autotmatic Project initialization

Two script that initialize a new project with one command. It will create a projects folder in the user profile home directory where all the futures project create using this command will be.

### Prerequisites

You will need to install the PyGithub library
```bash
pip install PyGithub
```

You will also need the [Atom](https://atom.io/) text editor because the script open it at the end. You can also modify the last line of the **[create.bat](batch/create.bat)** file to execute your favorite text editor.

### Installing

On your command-line type the following where you want locate this project:
```bash
git clone "https://github.com/G-Lauz/auto_project_init.git"
```

In the **[create.bat](batch/create.bat)** file, you will need to write the path that lead to this project. (e.g: C:/Users/G-Lauz/.../project_init_autmation):
```batch
echo [+] %DATE% - %TIME%:    Go to the script folder
set directory_path=<Path to this project directory>
```

Add a file named **secret.txt** in the project directory where are the **[script.py](script.py)** file and replace the following with yours:
```txt
<USERNAME>
<PASSWORD>
```

Finally you have to put the path of the **[create.bat](batch/create.bat)** file into your SYSTEM-PATH.

## How to use it

To create a new project simply type the following in your command-line:
```txt
create <ProjectName> [private]
```
* **ProjectName**: Write here your new project's name
* **private**: (*optional*) Write "private" if you want your project to be private on Github else leave it blank

## Built With

* [PyGithub](https://pypi.org/project/PyGithub/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* This project is inspired by a video from [Kalle Halden](https://github.com/KalleHallden) and also from the readaptation for Windows of [Tim Eichinger](https://github.com/eichingertim). Check out his repository: (https://github.com/eichingertim/ProjectCreationAutomation).
* Improvement are still planned
