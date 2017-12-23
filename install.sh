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

mkdir common

cd ../

mkdir src

cd src

mkdir common
mkdir common/{scss,img,js}
cd common/scss
mkdir page

git clone git@bitbucket.org:takanashi66/base.git

cd base
rm -rf .git
mv ./style.scss ../
