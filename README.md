# flutter_sample_app

## 環境構築
### ソースコードを clone
```bash
# https
git clone https://github.com/hiromu-kon/flutter_sample_app.git

# ssh
git clone git@github.com:hiromu-kon/flutter_sample_app.git
```


### FVMの導入
FVMをインストールしていない場合、
下記記事を参考に設定する。

* Mac https://zenn.dev/riscait/articles/flutter-version-management
* Windows https://qiita.com/idani/items/0e45d037b4c2a93840a7

### FVMの適用
プロジェクトのルートディレクトリに移動し、
下記コマンドを実行する。
```bash
fvm install
```


## 開発環境
```bash
$ fvm flutter --version

Flutter 3.0.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision fb57da5f94 (2 months ago) • 2022-05-19 15:50:29 -0700
Engine • revision caaafc5604
Tools • Dart 2.17.1 • DevTools 2.12.2
```


## ビルド
Configurations を選択してビルドする。

|Configurations 名 |説明                       |
|------------------|--------------------------|
|development       |開発環境      |
|staging     |テスト環境     |
|production       |本番環境       |
