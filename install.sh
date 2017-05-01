#!/bin/sh

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
cp gulp_task/package.json ./
rm -rf gulp_task

npm install

git init

echo '.*' > .gitignore
echo node_modules/ >> .gitignore

mkdir htdocs
cd htdocs/

mkdir pug
mkdir common
mkdir common/{sass,img,js}

cd common/js

mkdir es

cd ../sass

mkdir page

git clone git@bitbucket.org:takanashi66/base.git

cd base

mv ./style.scss ../

