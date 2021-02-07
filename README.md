#アプリ紹介

## アプリ名
Fieldwork Recorder

## 開発環境
-HTML5  
-CSS3  
-Javascript  
-Ruby 2.6.5  
-Ruby on Rails 6.0.3.4  
-Git version 2.24.3  

## URL
https://fieldwork-recorder.herokuapp.com/

※デプロイに使用したプラットホーム：Heroku

## 機能
①ユーザー管理機能  
②活動記事投稿機能（写真 最大3枚まで投稿可）  
③活動日数カウント機能  

## ペルソナ
-男性
  -本アプリが対象としているフィールドワークを行なっている学生人口は、（体感的に）男性が過半数を占めている傾向がある。現に、筆者在学中も、同学年で生徒５０人中、女性は９人であった。
-１８〜３０代・大学生〜大学院生（博士）
  -「①流行に敏感」で、最も自分の行動を「②発信する時間と環境が担保されている状態」なため

-某地方大学自然科学系学科在学3回生。授業・研究で月1〜5回のフィールドワークを課されている。  
就職活動が目前に迫り、企業に対し、頑張ってきた、過酷な環境フィールドワークを数十分の口頭面接だけで表現できないと思っている。また、つながりは無いが学会や他大学の同じ分野の学生と知り合いたいとも思っている。


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
ぎこちない覚えたてのコードで今までの自分を精一杯表現しました。  
少しでも多くの人に触っていただける作品になれば嬉しいです。  