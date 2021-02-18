class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many         :articles
  has_one_attached :avatar
  belongs_to       :major
  has_many         :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy


  with_options presence: true do
    validates :name
    validates :birthday
  end

  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  def was_attached?
    self.avatar.attached?
  end
end
