#!/bin/sh

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
cp gulp_task/package.json ./
rm -rf gulp_task

npm install --save-dev gulp browser-sync gulp-plumber gulp-sass gulp-notify gulp-autoprefixer gulp-sourcemaps gulp-merge-media-queries gulp-minify-css gulp-uglify gulp-minify-html

git init;

echo '.*' > .gitignore
echo node_modules/ >> .gitignore

mkdir htdocs
cd htdocs/

mkdir common
mkdir common/{sass,img,js}

cd common/js

mkdir module

cd ../sass

mkdir page

git clone git@bitbucket.org:takanashi66/base.git

cd base

mv ./style.scss ../

