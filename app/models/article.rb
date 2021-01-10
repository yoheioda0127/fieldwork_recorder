class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to        :user
  has_one_attached  :image_1
  has_one_attached  :image_2
  has_one_attached  :top_image
  belongs_to        :weather

  def was_attached?
    self.image.attached?
  end
  
end