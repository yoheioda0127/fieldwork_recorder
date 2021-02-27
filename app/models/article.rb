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

  validates :top_image,    presence: {message: 'は必須内容です。' }

  validates :title,        presence: true, length: {maximum: 30}

  validates :weather_id,   presence: true, numericality: { other_than: 1 }

  validates :location,     length: {maximum: 45}

  validates :appeal_point, length: {maximum: 120}

  validates :memo,         length: {maximum: 170}

end