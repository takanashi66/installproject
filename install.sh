#!/bin/sh

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

mkdir package

cd package

npm init -y
npm install --save-dev gulp browser-sync gulp-pleeease gulp-plumber gulp-sass

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
rm -rf gulp_task

cd ../

git init;

echo '.*' > .gitignore
echo package >> .gitignore