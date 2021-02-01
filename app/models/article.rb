class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to        :user
  has_one_attached  :image_1
  has_one_attached  :image_2
  has_one_attached  :top_image
  belongs_to        :weather

  def was_attached?
    self.top_image.attached?
  end
  
  with_options presence: {message: 'は必須内容です！！' } do
    validates :title
    validates :activity_date
  end

  # validates :title, {presence: true, length: {maximum: 30}}

  # validates :location, {presence: true, length: {maximum: 45}}

  # validates :memo, {presence: true, length: {maximum: 170}}

  # validates :appeal_point, {presence: true, length: {maximum: 120}}

end