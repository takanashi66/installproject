#!/bin/sh

git clone https://github.com/takanashi66/laravel-mix-config.git
cp laravelmixconfig/webpack.mix.js ./
cp laravelmixconfig/package.json ./
rm -rf laravel-mix-config

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

mkdir {scss,js}
cd scss
mkdir page

git clone https://github.com/takanashi66/base.git

cd base
rm -rf .git
mv ./style.scss ../

cd ../../js
echo '' > script.js
