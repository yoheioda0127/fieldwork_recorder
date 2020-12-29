#テーブル設計

＃＃usersテーブル
| Column             | Type    | Options     |
| --------------     | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| major_id           | integer | null: false | pulldown
| research_theme     | text    | null: false |
| introduction       | text    | null: false |

### Association
- has_many :articles


＃＃articlesテーブル
| Column       | Type    | Options           |
| ------------ | ------- | -------------     |
| major_id     | integer | foreign_key: true |
| title        | string  | null: false       |
| activity_date| date    | null: false       |
| weather_id   | integer | null: false       | pulldown
| memo         | text    | null: false       |
| appeal_point | text    |                   |

### Association
- belongs_to :user