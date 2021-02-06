# APP名
Fieldwork Recorder

## 開発環境


## URL
https://fieldwork-recorder.herokuapp.com/

デプロイ環境：Heroku

## 機能


## 利用方法


## テスト用アカウント
### Basic認証
  user-name:field / password:1212

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

Twitter https://twitter.com/Tech_geologist
Github  https://github.com/yoheioda0127/fieldwork_recorder

## 本アプリへの思い
私は小さな頃から恐竜が好きでした。  
両親にもその理解があり、博物館や大恐竜博などのイベントによく連れて行ってもらっていました。  
しかし、高校は私立。大学受験では浪人。  
夢のためにと学費をたくさんかけてくれました。  
両親には金銭的なことも含めいろいろな負担をかけたと思っています。  
大学大学院では地質学を学びました。  
特に地層の形成過程をサイエンスする「堆積学」という学問にハマりました。  
地層は「不均質な自然界に存在する直線や曲線」です。  
コレは「地球が46億年の歳月をかけてかけて作った唯一無二の芸術」だと思っています。  
また、大学、大学院で尊敬する2人の恩師に人間としても地質屋としても育ててもらいました。  
仲間もたくさんできました。  
同じ学問を楽しんだり、時には歯を食いしばって,共に課題をこなして頑張ったり、大学院受験で上京して他大学からきた私を優しく受け入れてくれました。  
現職では理解のある上司と同僚、先輩の元で好きな地層に対する仕事ができています。  
幸せそのものです。  
今の私は、間違いなく、いままで関わってきてくれた周囲の人たちのおかげでできています。  
しかし私はエンジニアになろうとしています。  
私の行為は、見方によってはいままで積み上げてきたものを捨てて未知の分野に飛び込むということです。  
地質が嫌いになったわけではありません。  
私は、自分の表現能力と可能性を広げたいだけです。  
プログラミングはどんな分野、業界にも通用する世界を包括しうる技術だと思い、魅力に感じています。  
このFieldwork Recorderは、そんな今までの周囲からのGIVEを遠ざけて、エンジニアになろうとしている最初の作品です。  
ぎこちない覚えたてのコードで自分を精一杯表現しました。  
少しでも多くの人に触っていただける作品になれば嬉しいです。  