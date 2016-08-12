#!/bin/sh

mkdir common
mkdir common/{css,img,js}

mkdir package

cd package

mkdir sass
cd sass

git clone git@bitbucket.org:takanashi66/base.git

cd ../

npm init -y
npm install --save-dev gulp browser-sync gulp-pleeease gulp-plumber gulp-sass

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
rm -rf gulp_task

cd ../

git init;

echo '.*' > .gitignore
echo package/node_modules >> .gitignore