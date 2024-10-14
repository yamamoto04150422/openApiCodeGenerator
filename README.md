# OpenAPI Code Generation using Docker

この手順では、OpenAPI 定義ファイル（openapi.yml）を使用して Swagger Codegen を利用し、TypeScript と Java のクライアントコードを生成する方法を説明します。

## 1. Prerequisites

1.  Docker Desktop がインストールされていることを確認してください。
2.  openapi.yml ファイルがプロジェクトルートディレクトリに存在することを確認してください。

## 2. Generate TypeScript Client Code

Docker を起動します（Docker Desktop を起動してバックグラウンドで動作させます）。

ターミナルで以下のコマンドを実行し、TypeScript クライアントコードを生成します。

```
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli-v3 generate \
 -i /local/openapi.yml \
 -l typescript-fetch \
 -o /local/out/typescript
```

生成されたコードは out/typescript ディレクトリに出力されます。

## 3. Generate Java Client Code

同様に、Java クライアントコードを生成するには以下のコマンドを実行します。

```
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli-v3 generate \
 -i /local/openapi.yml \
 -l java \
 -o /local/out/java
```

生成されたコードは out/java ディレクトリに出力されます。

## 4 ~ 5 の内容を sh で実行する。

```
./move_generated_files.sh
```

## 4. Move Generated Code to Your Project

生成されたコードをそれぞれのプロジェクトディレクトリに移動します。

```
// TypeScript のクライアントコードを移動

mv out/typescript frontend/src/api

find out/typescript -name "*.ts" -exec mv {} /path/to/your/repo/frontend/src/api \;

// Java のクライアントコードを移動

mv out/java backend/src/main/java/com/example/

```

## 5. Commit Generated Code to Version Control

それぞれのリポジトリで生成されたコードを Git に追加してコミットします。

```
cd /path/to/your/repo/frontend
git add src/api
git commit -m "Add generated TypeScript client code"

cd /path/to/your/repo/backend
git add src/main/java/com/example/client
git commit -m "Add generated Java client code"
```
## 補足 関連
[Markdown記法 チートシート](https://qiita.com/Qiita/items/c686397e4a0f4f11683d)
[OpenAPI Generatorを用いたクライアントコードの自動生成](https://heartbeats.jp/hbblog/2023/05/openapi.html)
[OpenAPI generatorを試してみる](https://qiita.com/amuyikam/items/e8a45daae59c68be0fc8)
