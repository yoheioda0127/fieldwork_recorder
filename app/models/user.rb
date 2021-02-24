class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise           :database_authenticatable, :registerable,
                   :recoverable, :rememberable, :validatable
  
  has_many         :articles
  has_one_attached :avatar
  belongs_to       :major
  has_many         :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many         :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many         :following, through: :active_relationships, source: :followed
  has_many         :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: 15}

  validates :reserch_theme, length: {maximum: 60}

  validates :introduction, length: {maximum: 150}

  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  # 英数半角記号

  validates :major_id, presence: true

  def was_attached?
    self.avatar.attached?
  end

    # ユーザーをフォローする
    def follow(other_user)
      self.following << other_user
    end
  
    # ユーザーをフォロー解除する
    def unfollow(other_user)
      self.active_relationships.find_by(followed_id: other_user.id).destroy
    end
  
    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      self.following.include?(other_user)
    end

end
