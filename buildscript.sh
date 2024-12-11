#!/bin/bash

# basic run cmd = ./buildscript.sh reponame -i -r

# checking if git is installed
check_git_initialization() {
  if command -v git > /dev/null; then
    echo "Git is installed: $(git --version)"
  else
    echo "Git is not installed. Installing Git..."
    sudo apt install git -y
  fi
}

# get repo name
get_repo_name() {
  while true; do
    echo -n "Enter repository name: "
    read repo_name

    if [ ${#repo_name} -lt 3 ]; then
      echo "Repository name must be at least 3 characters long. Please try again."
    else
      echo "Creating directory $repo_name..."
      mkdir -p "$repo_name"
      break
    fi
  done
}

# adding a readme file
add_readme() {
  while true; do
    echo -n "Add a README.md file? (y/n): "
    read readme

    if [ "$readme" = "y" ]; then
      echo "Creating README.md file..."
      echo "# $repo_name" > "$repo_name/README.md"
      echo "README.md created successfully!"
      break
    elif [ "$readme" = "n" ]; then
      echo "Skipping README.md creation."
      break
    else
      echo "Invalid input. Please enter 'y' or 'n'."
    fi
  done
}

# adding a gitignore file
add_gitignore() {
  while true; do
    echo -n "Add a .gitignore file? (y/n): "
    read gitignore

    if [ "$gitignore" = "y" ]; then
      echo "Creating .gitignore file..."
      touch "$repo_name/.gitignore"
      echo ".gitignore created successfully!"
      break
    elif [ "$gitignore" = "n" ]; then
      echo "Skipping .gitignore creation."
      break
    else
      echo "Invalid input. Please enter 'y' or 'n'."
    fi
  done
}

# setting up git for the repo
setup_git() {
  echo "Initializing Git repository..."
  cd "$repo_name"
  git init
  git add .
  git commit -m "Initial Commit"
  echo "Git repository initialized and files committed!"

  # while true; do
  #   echo -n "Do you want to push the repository to GitHub? (y/n): "
  #   read push_repo

  #   if [ "$push_repo" = "y" ]; then
  #     echo -n "Enter your GitHub username: "
  #     read username

  #     echo "> Adding remote origin..."
  #     git remote add origin git@github.com:$username/$repo_name.git
  #     echo "> Pushing repository to GitHub..."
  #     git branch -M main
  #     git push -u origin main
  #     echo "Repository pushed successfully!"
  #     break
  #   elif [ "$push_repo" = "n" ]; then
  #     echo "Skipping push to GitHub."
  #     break
  #   else
  #     echo "Invalid input. Please enter 'y' or 'n'."
  #   fi
  # done
}

# run all function
run() {
  check_git_installed
  get_repo_name
  add_readme
  add_gitignore
  setup_git

  echo "Repository setup complete!"
}

# run the script
run