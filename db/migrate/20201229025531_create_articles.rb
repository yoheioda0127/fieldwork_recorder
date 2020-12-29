class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer    :user_id          , foreign_key: true
      t.integer    :major_id         , foreign_key: true
      t.string     :title            , null: false
      t.date       :activity_date    , null: false
      t.integer    :weather_id       , null: false
      t.string     :location
      t.text       :appeal_point
      t.text       :memo             , null: false
      t.timestamps
    end
  end
end
