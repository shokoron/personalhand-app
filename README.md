# アプリケーション名
パーソナルハンド診断

## アプリケーション概要
結婚指輪を購入したいがどんな指輪を買えばいいか選ぶ基準が分からない方向けに、似合うリングの診断を行い選ぶ基準の一つにすることができる。

## URL
[https://personalhand-app.onrender.com](https://personalhand-app.onrender.com)

## テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：test@test.com
- パスワード：test1111

## 利用方法
1. トップページのヘッダーからユーザー新規登録登録を行う
2. トップページの診断スタートボタンをクリックする
3. 自分の指に近い画像をクリックしていくと診断結果が表示される
4. 診断結果ページに表示されている「オススメのデザインはこちら」ボタンをクリックするとオススメのデザインが表示される
5. トップページへ戻り、ヘッダーにあるユーザーボタンをクリックすると、ユーザーの診断結果が表示される

## アプリケーションを作成した背景
販売員としてお客様にブライダルリングを提案する際に、お客様が自分に似合うリングを選ぶ際の迷われている姿を目の当たりにし、お客様に似合うリングを事前に診断できるアプリがあればお客様も販売員も接客時間の短縮になると考えました。

## 洗い出した要件
[要件定義書はこちら](https://docs.google.com/spreadsheets/d/1yjyy30Wbbbl2m3-3h-_diX-u1fUmyq08wm9eZ6v695A/edit#gid=0)

## 実装した機能についての画像やGIFおよびその説明

![診断スタート](https://i.gyazo.com/22547f622ac28abc615f3e3912dd1eb3.gif)
診断スタートボタンをクリック後、自分の指に近いタイプの画像をクリックしていくと診断結果ページに推移します。

![オススメデザイン](https://i.gyazo.com/cd47235b57abefc92ff14b4a523c537f.gif)
オススメのデザインはこちらボタンをクリックすると、ユーザーの診断結果に基づいたオススメデザインページへ推移します。

![ユーザー診断結果](https://i.gyazo.com/168a720df23cae7620c0d10d54e8e3c3.gif)
トップページヘッダーにあるユーザーマークをクリックすると、ユーザーの最新診断結果が表示されます。



## データベース設計

[![Image from Gyazo](https://i.gyazo.com/c621e38333d0421f41bb28dd90643e25.png)](https://gyazo.com/c621e38333d0421f41bb28dd90643e25)


## テーブル設計

## Users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |


### Association

- has_many :diagnoses


## Diagnoses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| long_fingers       | boolean    | null: false                    |
| thick_fingers      | boolean    | null: false                    |
| finger_shape       | string     | null: false                    |
| webbed_fingers     | boolean    | null: false                    |


### Association

- belongs_to :user


## RecommendedRings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| ring_type          | string     | null: false                    |



## 開発環境

- フロントエンド
- バックエンド
- インフラ
- テキストエディタ
- タスク管理

## ローカルでの動作方法

以下のコマンドを順に実行してください。
% git clone https://github.com/shokoron/personalhand-app.git
% cd personalhand-app
% bundle install

## 工夫したポイント

- **直感的な操作**: 診断プロセスを簡潔でわかりやすいステップに分け、ユーザーが迷わずに進めるようにした。
- **視覚的な楽しさ**: 画像やイラストを用いて、ユーザーの関心を引きつけ、診断プロセスを楽しい体験になるようにした。
- **個人に合わせた提案**: ユーザーの選択に基づいて、個別化されたリングタイプの提案を行った。
- **詳細な解説付きの結果**: 診断結果には、なぜそのリングタイプが選ばれたのかを説明する詳細なテキストを作成した。
- **診断結果の保存**: ユーザーの診断結果を保存し、ユーザー詳細ページで最新の診断結果をいつでも参照できるようにした。

## 改善点

- **多様なリングスタイルの提供**: より多くのリングスタイルやデザインをデータベースに追加し、選択肢を増やす。
- **トレンドを反映**: トレンドを反映したり、独自性の高いデザインを取り入れることで、ユーザーの関心を引く。

## 制作時間

- 14日













