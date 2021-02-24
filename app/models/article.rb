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

  validates :title, length: {maximum: 30}

  validates :location, length: {maximum: 45}

  validates :memo, length: {maximum: 170}

  validates :appeal_point, length: {maximum: 120}

end