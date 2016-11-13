#!/bin/sh

npm init -y
npm install --save-dev gulp browser-sync gulp-plumber gulp-sass gulp-notify gulp-autoprefixer gulp-sourcemaps gulp-merge-media-queries gulp-minify-css gulp-uglify gulp-minify-html

git clone git@bitbucket.org:takanashi66/gulp_task.git
cp gulp_task/gulpfile.js ./
rm -rf gulp_task

git init;

echo '.*' > .gitignore
echo node_modules/ >> .gitignore

mkdir htdocs
cd htdocs/

mkdir common
mkdir common/{sass,img,js}

cd common/sass

echo '@charset "UTF-8";' > style.scss

git clone git@bitbucket.org:takanashi66/base.git

