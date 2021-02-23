# オリジナルアプリ紹介

## 開発したアプリ名
Fieldwork Recorder

## 開発環境
- HTML5  
- CSS3  
- Javascript  
- Ruby 2.6.5  
- Ruby on Rails 6.0.3.4  
- Git version 2.24.3  

## URL
http://54.168.22.24/
※本番環境：AWS EC2

## Cloneの作成

```
- % git clone https://github.com/yoheioda0127/fieldwork_recorder.git
```

## 機能
① 野外活動写真を投稿機能。  
② 実名、もしくはニックネームで登録＆投稿機能  
③ 他ユーザーとのフォロー機能  
④ 投稿に対してのメッセージ機能  
⑤ 投稿に対してのいいね機能  
⑥ ダイレクトメール機能  


## ペルソナ
- 男性  
本アプリが対象としているフィールドワークを行なっている学生人口は、（体感的に）男性が過半数を占めている傾向がある。現に、筆者在学中も、同学年で生徒５０人中、女性は９人でした。  
- １８〜３０代・大学生〜大学院生（博士）  
「①流行に敏感」で、最も自分の行動を「②発信する時間と環境が担保されている状態」なためです。  

- 上記を踏まえた具体的なユーザーストーリー
某地方大学自然科学系学科在学3回生で、授業・研究で月1〜5回のフィールドワークを課されています。写真はこれまでの実習、研究活動でたくさん撮影しており、パソコン内に大量に保管しています。「面白いものを見つけた！」と同学科の友人へ共有したいと思っています。しかし、ツイッターやインスタグラムでは、①分野外の他愛もない投稿に埋もれてしまい、投稿が見て欲しい人に届かない。②そもそも分野外の人に見られる事が恥ずかしい。という問題を抱えていました。  
また本人は、学会や他大学の同じ分野の学生と知り合いたいとも思っています。



<!-- ## 利用方法 -->


## テスト用アカウント
### Basic認証
  user-name:field / password:1212
### ユーザー
- ニックネーム: まいけみ
- メールアドレス: maikemi@gamil.com
- パスワード: a025987

<!-- ### サンプルユーザー
その１
User.create(name: "ようへい" , email: "yohei@gmail.com", password: "a02598765",encrypted_password: "" ,birthday: "19920127", school_and_company: "千葉大学大学院", major_id: "2",research_theme: "上総層群梅ヶ瀬層の塊状砂岩層の形成過程", introduction: "はじめまして、堆積学を専攻している大学院２年生です。アウトプットの場を増やそうとアプリをはじめました。よろしくお願いいたします。")

その２
User.create(name: "まさき" , email: "masaki@gmail.com", password: "a02598765",encrypted_password: "" ,birthday: "19930317", school_and_company: "新潟大学", major_id: "2",research_theme: "魚沼層群のシーケンス層序学", introduction: "はじめまして、堆積学を専攻している学部生です。アウトプットの場を増やそうとアプリをはじめました。よろしくお願いいたします。")

### サンプル記事

その１
Article.create(user_id: "5" , major_id: "2" ,title: "初めての野外調査", activity_date: "20200122",weather_id: "2", location: "新潟県長岡市小国地先", memo: "実習の時とは異なるコースでかなり苦戦した。また、位置確認が困難なコースだった。" , appeal_point: "マップを複数枚印刷して、水没に備えた。")

その２
Article.create(user_id: "4" , major_id: "1" ,title: "ボートを使用した野外調査", activity_date: "20200628",weather_id: "4", location: "千葉県市原市養老川付近", memo: "層厚最大20mのものが見られる。" , appeal_point: "ゴムボートを購入して、調査に導入したこと。") -->



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
①コメント機能（フォローなどの交流システム）  
②ポートフォリオ機能（概要考える）  
③テストコード記述  
④汚いコードを単純化作業  

<!-- ## ライセンス -->


## 作者

Twitter https://twitter.com/Tech_geologist  
Github  https://github.com/yoheioda0127/fieldwork_recorder  

## 本アプリへの思い
私は小さな頃から恐竜が好きでした。  
両親にもその理解があり、博物館や大恐竜博などのイベントによく連れて行ってもらっていました。  
しかし、高校は私立。大学受験では浪人。  
夢のためにと、両親は私にたくさんのお金をかけてくれました。  
両親には金銭的なことも含め様々な負担をかけたと思っています。  
大学大学院では地質学を学びました。  
特に地層の形成過程をフィールドワークでサイエンスする「堆積学」という学問にハマりました。  
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
私は、自分の表現能力と可能性を広げたいと思っています。  
プログラミングはどんな分野、業界にも通用する「世界を包括しうる技術」だと思い、魅力に感じています。  
このFieldwork Recorderは、そんな今までの周囲からのGIVEを遠ざけて、エンジニアになろうとしている最初一歩に当たる作品です。  
ぎこちない覚えたてのコードで今までの自分を精一杯表現しました。  
少しでも多くの人に触っていただける作品になれば嬉しいです。  