#!/usr/bin/env sh
 
# 确保脚本抛出遇到的错误
set -e
 
# 生成静态文件 , yarn docs:build
npm run docs:build
rm -rf ../../webxiu.github.io/space/*

# 将build生成的dist目录拷贝至上一层目录中 
cp -rf dist/* ../../webxiu.github.io/space/

# 进入生成的文件夹 
cd ../../webxiu.github.io

# git初始化，每次初始化不影响推送
git init
git add .
git commit -m 'deploy'
# git branch -M main

# 如果你想要部署到
git push -f git@github.com:webxiu/webxiu.github.io.git master