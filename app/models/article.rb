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

  validates :title,        presence: {message: 'を入力してください。' }, length: {maximum: 30, message: 'は30文字以内です。'}

  validates :top_image,    presence: {message: 'は必須内容です。' }

  validates :weather_id,   presence: true, inclusion: {in: 1..15 }

  validates :location,     length: {maximum: 45, message: 'は45文字以内です。'}

  validates :appeal_point, length: {maximum: 120, message: 'は120文字以内です。'}

  validates :memo,         length: {maximum: 170, message: 'は170文字以内です。'}

end