import os
import sys
from github import Github

with open("secret.txt" , 'r') as file:
    secret = file.read().splitlines()

git_username = secret[0]
git_password = secret[1]
project_name = sys.argv[1]

private = False
if len(sys.argv) > 2:
    if sys.argv[2] is "private":
        private = True

path = os.path.join(os.environ['USERPROFILE'], "projects\\")

def create_folder(project_name : str):
    try:
        os.makedirs(path + project_name, exist_ok=False)

    except OSError as err:
        print("The project already exist.")
        project_name = input("Enter a new project name: ")
        create_folder(project_name)

    return project_name

def create_repository(project_name:str, git_username:str, git_password:str):
    user = Github(git_username, git_password).get_user()

    if private:
        print("Creating private repository...")
    else:
        print("Creating public repository...")

    user.create_repo(project_name, private=private)
    print("Succesfully created repository " + project_name)

if __name__ == "__main__":
    project_name = create_folder(project_name)
    create_repository(project_name, git_username, git_password)
