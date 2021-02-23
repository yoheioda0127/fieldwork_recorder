# オリジナルアプリ紹介

## 開発したアプリ名
Fieldwork Recorder

## 開発環境
- macOS Catalina 10.15.7
- Visual Studio Code
- Github  

- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- HTML
- CSS
- MySQL 5.6

## URL
http://54.168.22.24/  
※本番環境：AWS EC2

## Cloneの作成

```
% git clone https://github.com/yoheioda0127/fieldwork_recorder.git
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

### articlesテーブル
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

## DEMO（※ローカル環境での稼働状況）

### トップページ（投稿一覧機能）
トップ画像には、これまでフィールドワークで撮影してきた写真を扉絵をして展示してあります。Swiperにてオートスライド機能を実装しています。最上部のバナーは、常時表示されます（DEMO1-3）。  
下にスクロールすると、タイムラインに移り、全ユーザー全ての投稿を見ることができます（DEMO画像4）。投稿内容は未ログイン時でもアクセス可能です。  
- 未ログイン時  
　画面上部のバナー右側に、新規登録ボタンと、ログインボタンを配置しています（サンプル画像1）。

- ログイン時  
　上部バナーの表示が全て変わり、左から、ログアウトボタン、プロフィール編集ボタン、ユーザー名ボタン（プロフィールへ）、新規記事投稿ボタンが表示されます（DEMO画像3）。


![DEMO画像1](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F1.png)  
DEMO画像1. トップ画面イメージ（未ログイン時）

![DEMO画像2](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F2.gif)  
DEMO画像2. オートスライド機能の動作

![DEMO画像3](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F3.png)  
DEMO画像3. トップ画面イメージ（ログイン時）

![DEMO画像4](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F4.png)  
DEMO画像4. トップ画面下部のタイムライン（未ログイン時）


### 新規登録・ログイン画面

未ログイン状態で画面右上の新規登録ボタンを押すと、新規登録画面へ遷移します。必要情報を入力し、最下部の登録ボタン（緑色）を押すことによって登録完了となります（DEMO画像5, 6）。  
登録情報は以下の通りです。（*　は必須）

- 名前 or ニックネーム*
- プロフィール画像（任意）  
　　※登録しなかった場合は、下図のアバターになります。
　　　
- メールアドレス*
- パスワード*（確認用含め2回）
- 専門科目（選択）
- 現在の研究・興味のあるテーマ
- 自己紹介

新規登録完了後、ログインボタンよりログインが可能です。  
ログイン時の入力情報は以下の通りです（DEMO画像7）。  

- メールアドレス
- パスワード


![DEMO画像5](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F5.png)  
DEMO画像5. ユーザー新規登録画面　最上部

![DEMO画像6](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F6.png)  
DEMO画像6. ユーザー新規登録画面　最下部

![DEMO画像7](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F7.png)  
DEMO画像7. ログイン画面

### 活動記事投稿画面

ログイン状態で画面右上の記事投稿ボタン（オレンジ色）を押すと、活動記事投稿画面へ遷移します。必要情報を入力し、最下部の登録ボタン（緑色）を押すことによって投稿完了となります（DEMO画像8, 9）。  
投稿情報は以下の通りです。（*　は必須）

- タイトル*
- 調査日*（選択）
- 活動写真*（最大3枚まで投稿可能、1枚は必須）
- パスワード（確認用含め2回）
- 当日の天気（選択）
- 調査地
- 活動メモ
- 工夫した点

![DEMO画像8](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F8.png)  
DEMO画像8. 活動記事投稿画面　最上部


![DEMO画像9](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F9.png)  
DEMO画像9. 活動記事投稿画面　最下部

### 記事詳細画面

トップページのタイムラインにて、投稿されている活動記事を選択すると、記事詳細画面へ遷移します（DEMO画像10）。最大3枚の写真が表示されます。写真の並び順は、記事投稿時の①〜③に対応しています（①が左、②が中央、③が右）（DEMO画像8）。  

また、ユーザー名（ここでは「ようへい」）はユーザー詳細画面へのリンクです（DEMO画像14-16）。  

下へスクロールすると、直下に記事編集・削除ボタンと、TOPへ戻るボタンが出現します（DEMO画像11）。  


![DEMO画像10](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F10.png)  
DEMO画像10. 記事詳細画面　最上部

![DEMO画像11](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F11true.png)  
DEMO画像11. 記事詳細画面　最下部

### 記事の編集・削除画面

記事詳細画面下部の「記事の編集・削除を行うボタン」から記事編集・削除画面へ遷移することができます。（DEMO画像11-13）。  
フォームには既に投稿したデータが入っており、そのまま下部の「更新するボタン」（緑）を押しても登録可能です。  
変更可能内容は、投稿時と同様、以下のとおりです。（*　は必須）  

- タイトル*
- 調査日*（選択）
- 活動写真*（最大3枚まで投稿可能、1枚は必須）
- パスワード（確認用含め2回）
- 当日の天気（選択）
- 調査地
- 活動メモ
- 工夫した点


![DEMO画像12](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F12.png)  
DEMO画像12. 編集・削除画面（最上部）

![DEMO画像13](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F13.png)  
DEMO画像13. 編集・削除画面（最下部）


### ユーザー詳細画面

「ページ上部バナー」、及び「記事詳細画面」のユーザー名（ようへい）はユーザ詳細ページへのリンクです（DEMO画像10, 14）。  
新規ユーザー登録時に記述した内容が表示されいています。赤い数字の「3」は、投稿している記事の数を、フィールドワークの要である「活動日数」としてカウントしています（DEMO画像14, 15）。  

他のユーザーでログインしている場合は、フォロー、アンフォローのアクションが「フォローボタン」で可能です（DEMO画像16, 17）。  


![DEMO画像14](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F14.png)  
DEMO画像14. ユーザー詳細画面

![DEMO画像15](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F15.png)  
DEMO画像15. ユーザー詳細画面　下部


![DEMO画像16](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F16.png)  
DEMO画像16. ユーザー詳細画面　他ユーザーを未フォロー

![DEMO画像17](https://github.com/yoheioda0127/fieldwork_recorder/blob/master/DEMO%E7%94%BB%E5%83%8F17.png)  
DEMO画像17. ユーザー詳細画面　他ユーザーをフォロー中

<!-- ## ライセンス -->


## 作者

Twitter https://twitter.com/Tech_geologist  
Github  https://github.com/yoheioda0127  

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
