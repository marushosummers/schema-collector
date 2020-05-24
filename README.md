# schema-collector
Collecting MySQL Database Schema by SchemaSpy 

Python の repository を作る時に毎回するセットアップをまとめておく。

## 使用方法
基本的にはこの repository の中身をコピーすればOK。必要なのは以下のファイル・フォルダ。

```shell
.
├── .github
├── .gitignore
├── Pipfile
├── Pipfile.lock
├── README.md
├── main.py
├── rename_me
├── setup.py
└── tests
```

### 各 repository ごとに修正するところ
* [README.md](./README.md): それぞれの repository にあった説明に変える。
* [rename_me](./rename_me): source ファイルを入れるフォルダ。 repository に応じて名前を変える。
* [setup.py](./setup.py): `name`, `description`, `url` を上記の source フォルダ名などに応じて変える。

===

以下はそのまま流用可能。

# 開発
## 準備
依存関係の解決なども pipenv によって行っているのでインストールする。
また、必要なバージョンをインストールできるように pyenv もインストールしておく。


## 環境構築
以下のコマンドで依存関係を解消する。

```shell
pipenv install --dev
```


## 実行方法
以下のコマンドで [main.py](./main.py) を実行する。

```shell
pipenv run start
```


## テスト
```shell
pipenv run test
```

## Linter
```shell
pipenv run lint
```

自動で修正する場合は以下のコマンドを実行する。

```shell
pipenv run format
```

# CI
Circle CI の config を [`.circleci/config.yml`](./.circleci/config.yml) に記述している。現在は以下の設定になっている。

* すべての commit に対して test が走る。
* master への commit に対して、 `release/{date}_{number}` タグが切られる。

このため、基本的には `dev` ブランチを切って、それを default ブランチに設定し、`master` への commit は `dev` ブランチのマージによって行うと良い。このリポジトリ自体は release の概念はないので、 `master` のみを用意している。

