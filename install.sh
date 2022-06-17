#!/bin/sh

git clone git@github.com:takanashi66/laravel-mix-config.git
cp laravel-mix-config/webpack.mix.js laravel-mix-config/package.json laravel-mix-config/svg.config.json laravel-mix-config/svgo.config.json laravel-mix-config/imagemin.config.mjs ./
rm -rf laravel-mix-config

npm install

# 引数にreactがある場合は追加でパッケージをインストール
if [ $1 = "react" ]; then
    npm i react react-dom  @babel/preset-react
    
    sed -i -e "s/('resources\/js\/script.js', 'public\/common\/js')/('resources\/js\/app.js', 'public\/common\/js').react()/" webpack.mix.js
    rm -rf webpack.mix.js-e
fi

git init

echo node_modules/ >> .gitignore

mkdir public
cd public/


if [ $1 = "react" ]; then
# 引数にreactがある場合はreact用のhtmlを追加
cat << EOF > index.html    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="common/css/style.css">
    <link rel="icon" href="" type="image/png">
    <title>Document</title>
</head>
<body>
    
    <div id="app"></div>
    
    <script src="common/js/app.js"></script>
</body>
</html>
EOF

else
# 引数にreactがない場合は通常のhtmlを追加
cat << EOF > index.html    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="common/css/style.css">
    <link rel="icon" href="" type="image/png">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
EOF

fi



mkdir common

cd ../

mkdir resources

cd resources

mkdir {scss,js}
cd scss
mkdir page

git clone git@github.com:takanashi66/base.git

cd base
rm -rf .git
mv ./style.scss ../

cd ../../js
if [ $1 = "react" ]; then
# 引数にreactがあった場合app.jsを作成
cat << EOF > app.js    
import React from 'react';
import { createRoot } from 'react-dom/client';

const App = props => {
    
    return (
        
        <p>React</p>
        
    )

}

//レンダリング
const container = document.getElementById('app');
const root = createRoot(container);
root.render(<App />);
EOF

else
# 引数がない場合はscript.jsを作成
echo '' > script.js

fi

npm run dev
