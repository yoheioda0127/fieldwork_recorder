# APP名
Fieldwork Recorder

## 開発環境

## URL
https://fieldwork-recorder.herokuapp.com/

## 機能


## 利用方法


## テスト用アカウント
### Basic認証
  username:field / password:1212

### サンプルユーザー
その１
User.create(name: "ようへい" , email: "yohei@gmail.com", password: "a02598765",encrypted_password: "" ,birthday: "19920127", school_and_company: "千葉大学大学院", major_id: "2",research_theme: "上総層群梅ヶ瀬層の塊状砂岩層の形成過程", introduction: "はじめまして、堆積学を専攻している大学院２年生です。アウトプットの場を増やそうとアプリをはじめました。よろしくお願いいたします。")

その２
User.create(name: "まさき" , email: "masaki@gmail.com", password: "a02598765",encrypted_password: "" ,birthday: "19930317", school_and_company: "新潟大学", major_id: "2",research_theme: "魚沼層群のシーケンス層序学", introduction: "はじめまして、堆積学を専攻している学部生です。アウトプットの場を増やそうとアプリをはじめました。よろしくお願いいたします。")

### サンプル記事

その１
Article.create(user_id: "5" , major_id: "2" ,title: "初めての野外調査", activity_date: "20200122",weather_id: "2", location: "新潟県長岡市小国地先", memo: "実習の時とは異なるコースでかなり苦戦した。また、位置確認が困難なコースだった。" , appeal_point: "マップを複数枚印刷して、水没に備えた。")

その２
Article.create(user_id: "4" , major_id: "1" ,title: "ボートを使用した野外調査", activity_date: "20200628",weather_id: "4", location: "千葉県市原市養老川付近", memo: "層厚最大20mのものが見られる。" , appeal_point: "ゴムボートを購入して、調査に導入したこと。")



## アプリ設計


### ER図(DB設計)


### テーブル設計

### usersテーブル
| Column             | Type    | Options     |
| --------------     | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| major_id           | integer | null: false | pulldown
| school_and_company | text    |             |
| research_theme     | text    |             |
| introduction       | text    | null: false |

#### Association
- has_many :articles

###articlesテーブル
| Column       | Type    | Options           |
| ------------ | ------- | -------------     |
| major_id     | integer | foreign_key: true |
| title        | string  | null: false       |
| activity_date| date    | null: false       |
| weather_id   | integer | null: false       | pulldown
| memo         | text    | null: false       |
| appeal_point | text    |                   |

#### Association
- belongs_to :user


## 今後の実装予定


## ライセンス


## 作者

