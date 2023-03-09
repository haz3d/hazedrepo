#!/bin/bash

echo "Where are you using this script? (Termux/Ubuntu/Arch)"
read os

echo "Checking for required dependencies..."

if [ $os == "Termux" ]
then
    if ! command -v figlet &> /dev/null
    then
        echo "figlet not found. Installing..."
        pkg install figlet
    fi

    if ! command -v git &> /dev/null
    then
        echo "git not found. Installing..."
        pkg install git
    fi

elif [ $os == "Ubuntu" ]
then
    if ! command -v figlet &> /dev/null
    then
        echo "figlet not found. Installing..."
        sudo apt-get update && sudo apt-get install -y figlet
    fi

    if ! command -v git &> /dev/null
    then
        echo "git not found. Installing..."
        sudo apt-get update && sudo apt-get install -y git
    fi

elif [ $os == "Arch" ]
then
    if ! command -v figlet &> /dev/null
    then
        echo "figlet not found. Installing..."
        sudo pacman -S figlet
    fi

    if ! command -v git &> /dev/null
    then
        echo "git not found. Installing..."
        sudo pacman -S git
    fi

else
    echo "Invalid choice, Stop."
fi

echo "Loading..."
sleep 2
clear
sleep 1
figlet GIT

echo "What's your GitHub username?"
read gituname

git config --global user.name $gituname
sleep 2

echo "Welcome, You are logged in as $gituname"
echo "[1] Rebase [2] Commit [3] Push [4] Pull/n[5] Add"
read gitoption

if [ "$gitoption" = "1" ]
then
    git rebase
elif [ "$gitoption" = "2" ]
then
    sleep 1 
    echo "Commit Name?"
    read commitname
    git commit -m "$commitname"
elif [ "$gitoption" = "3" ]
then
    git push
elif [ "$gitoption" = "4" ]
then
    git pull
elif [ "$gitoption" = "5" ]
then
    git add .
else
    echo "Invalid option, Stop."
fi
