#!/bin/sh

cd /Users/takanashi66/Dropbox/workspace/web/

echo "What is file name? : "
read name
mkdir $name
cd $name

mkdir common
cd common

mkdir css
mkdir img
mkdir js
mkdir sass
mkdir gulp

compass create --sass-dir "sass" --output-style "compressed" --relative-assets --no-line-comments --bare

cd gulp

sudo npm install --save-dev gulp browser-sync gulp-compass gulp-plumber gulp-pleeease gulp-uglify gulp-rename;

git clone git@bitbucket.org:takanashi66/gulp_task.git;
cp gulp_task/gulpfile.js ./;
rm -rf gulp_task;

cd ../../

git init;

echo .* > .gitignore
echo common/gulp/node_module >> .gitignore

cd /Users/takanashi66/Dropbox/workspace/web/$name/common/gulp/
