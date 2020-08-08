#!/bin/sh
FOLDER=${1?Error: no folder given}
LANGUAGE=${2:-unassigned}

function parseCommand() {
case $1 in 
    --py | --python)
        pipenv install
        ;;
    --js | --javascript)
        npm init -y
        ;;
    --ts | --typescript)
        npm init -y && npm install --save-dev typescript
        ;;
    --react | --React) 
        npx create-react-app .
        ;;
    --tsx)
        npx create-react-app . --template typescript
esac
}

if ! [[ $FOLDER == '.' || $FOLDER =~ ^--.* ]];
then
    mkdir "./$FOLDER" && cd "./$FOLDER" 
fi
git init
parseCommand $LANGUAGE
if ! [ -e ".gitignore" ];
then
    touch .gitignore
fi
if ! [ -e "README.md" ];
then
    touch README.md
fi
git add . && git commit -m "First Commit"

# https://gist.github.com/bradtraversy/ac3b1136fc7d739a788ad1e42a78b610