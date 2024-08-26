#!/bin/bash

# 移動先ディレクトリの作成
mkdir -p frontend/src/api
mkdir -p backend/src/main/java/com/example/client

# TypeScriptの型ファイルのみを移動
find out/typescript -name "*.ts" -exec mv {} frontend/src/api \;

# Javaの型ファイルのみを移動
find out/java -name "*.java" -exec mv {} backend/src/main/java/com/example/client \;

