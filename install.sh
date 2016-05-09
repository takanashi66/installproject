#!/bin/sh

mkdir html;
cd html;
mkdir common;
cd common;
mkdir css;
mkdir js;
mkdir img;

cd ../../;
mkdir src;
cd src;

compass create --sass-dir "sass" --output-style "compressed" --relative-assets --no-line-comments --bare

sudo npm install --save-dev gulp browser-sync gulp-compass gulp-plumber;

git clone git@bitbucket.org:takanashi66/gulp_task.git;
cp gulp_task/gulpfile.js ./;
rm -rf gulp_task;

cd ../

git init;

