#!/bin/sh

cd /Users/takanashi66/Dropbox/workspace/web/

echo "What is file name? : "
read name

if [ "" == "$name" ];then
  echo 'Error! no input name.'
  exit 1
fi

mkdir $name
cd $name

mkdir common
mkdir common/{css,img,js}

cd common

compass create --sass-dir "sass" --relative-assets --no-line-comments --bare

cd ../

mkdir gulp

cd gulp

sudo npm init -y
sudo npm install --save-dev gulp browser-sync gulp-compass gulp-plumber

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
rm -rf gulp_task

cd ../

git init;

echo .* > .gitignore
echo src/node_module >> .gitignore
