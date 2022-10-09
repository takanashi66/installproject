#!/bin/sh

if [ $1 = "wp" ]; then
    if expr $2 : "[1-9][0-9][0-9][0-9]$" >&/dev/null;then
        if [ -n "$3" ]; then
             val="$(echo $3 | sed -e 's/[^[:alnum:]]//g')"
            if [ "$val" != "$3" ]; then
                echo "プロジェクト名は英数字のみで入力してください"
                exit 1
            fi
        else
            echo "プロジェクト名が設定されていません"
            exit 1
        fi
    else
        echo "ポートが正しく設定されていません。"
        exit 1
    fi
    
fi

echo "CHECK OK"

git clone git@github.com:takanashi66/laravel-mix-config.git
cp laravel-mix-config/webpack.mix.js laravel-mix-config/package.json laravel-mix-config/svg.config.json laravel-mix-config/svgo.config.json laravel-mix-config/imagemin.config.mjs laravel-mix-config/.editorconfig ./

# 引数にwpがある場合は追加でパッケージをインストール
if [ $1 = "wp" ]; then
    
    if expr $2 : "[1-9][0-9][0-9][0-9]$" >&/dev/null;then
        
        port=$2
        wpsport=$((port + 100))
        testsport=$((port + 10))
        uisport=$((port + 1))
        
        rm -rf package.json
        mv laravel-mix-config/wp-env.json .wp-env.json
        mv laravel-mix-config/package.wp.json ./package.json
        npm i @wordpress/env
        
        sed -i -e "s/9999/$wpsport/" .wp-env.json
        sed -i -e "s/0000/$testsport/" .wp-env.json
        
        sed -i -e "s/proxy: false/proxy: \"localhost:$wpsport\"/" webpack.mix.js
        sed -i -e "s/server: 'public'/server: false/" webpack.mix.js
        sed -i -e "s/port: 3000/port: $2/" webpack.mix.js
        sed -i -e "s/port: 3001/port: $uisport/" webpack.mix.js
        if [ -n "$3" ]; then
            
            val="$(echo $3 | sed -e 's/[^[:alnum:]]//g')"
            if [ "$val" = "$3" ]; then
               
               sed -i -e "s/public\/common/public\/themes\/$3\/common/" webpack.mix.js
                
            else
                echo "プロジェクト名は英数字のみで入力してください"
                exit 1
            fi
        else
            echo "プロジェクト名が設定されていません"
            exit 1
        fi
        rm -rf .wp-env.json-e
        rm -rf webpack.mix.js-e
        
        
    else
        echo "ポートが正しく設定されていません。"
        exit 1
    fi
    
fi

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

cd ../../
npm run dev

if [ $1 = "wp" ]; then
    rm -rf public/common
    rm -rf public/index.html
    cd public/themes/$3
    touch functions.php
    cat << EOF > style.css
Theme Name: $3
Version: 1.0
/*! ******************************
*** date 2022.01.01
*** *****************************/
EOF

cat << EOF > index.php    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="">
    <link rel="icon" href="" type="image/png">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
EOF

fi
