#!/bin/sh

git clone git@github.com:takanashi66/laravel-mix-config.git
cp laravel-mix-config/webpack.mix.js laravel-mix-config/package.json laravel-mix-config/svg.config.json laravel-mix-config/svgo.config.json laravel-mix-config/imagemin.config.js ./
rm -rf laravel-mix-config

npm install

git init

echo node_modules/ >> .gitignore

mkdir public
cd public/

mkdir common

cd ../

mkdir resources

cd resources

mkdir assets

cd assets

mkdir {scss,js}
cd scss
mkdir page

git clone git@github.com:takanashi66/base.git

cd base
rm -rf .git
mv ./style.scss ../

cd ../../js
echo '' > script.js
