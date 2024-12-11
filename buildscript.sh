#!/bin/bash

# basic run cmd = ./buildscript.sh reponame -i -r

# checking if git is installed
if command -v git > /dev/null; then
  echo "Git is installed: $(git --version)"
else
  sudo apt install git
fi

CMD_LIST=($1 $2 $3)

# preparing cmds
echo "Preparing commands..."
if [ ${#CMD_LIST[@]} -eq 0 ]; then
  echo " > Please enter a valid command > ./buildscript.sh reponame -i -r"
else
  if [ ${#1} -lt 3 ]; then
    echo "  > Repo name must be greater than 4 characters"
  else
    echo "  > Creating $1 repo..."
    mkdir $1/
    echo "  > $1 repo Created!"
    if [ "$2" = "-i" ]; then
      echo "  > Creating .gitignore file..."
      touch $1/.gitignore
      echo "  > .gitignore > Created!"
    fi
    if [ "$3" = "-r" ]; then
      echo "  > Creating README.md file..."
      echo "# $1" > $1/README.md
      echo "  > README.md > Created!
"
    fi

    cd $1
    git init
    git add . 
    git commit -m "Initial Commit"

    echo "
  > Git repository initialized and committed!"
  fi
fi

