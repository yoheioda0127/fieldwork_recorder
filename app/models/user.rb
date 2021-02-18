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


  with_options presence: true do
    validates :name
  end

  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  def was_attached?
    self.avatar.attached?
  end

    # ユーザーをフォローする
    def follow(other_user)
      following << other_user
    end
  
    # ユーザーをフォロー解除する
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
  
    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end

end
