#!/bin/sh

cd /Users/takanashi66/Dropbox/workspace/web/

echo -n "What is file name? : "
read name
mkdir $name
cd $name
mkdir common
mkdir common/css
mkdir common/img
mkdir common/js

mkdir src
cd src
compass create --sass-dir "sass" --output-style "compressed" --relative-assets --no-line-comments --bare

mkdir js

sudo npm install --save-dev gulp browser-sync gulp-compass gulp-plumber gulp-combine-media-queries;

git clone git@bitbucket.org:takanashi66/gulp_task.git;
cp gulp_task/gulpfile.js ./;
rm -rf gulp_task;

cd ../

git init;

echo .* > .gitignore
echo src/node_module >> .gitignore
