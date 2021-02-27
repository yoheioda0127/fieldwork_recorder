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

  validates :name,                presence: { message: 'は必須内容です。' }, length: {maximum: 15, message: 'は15文字以内です。'}

  validates :research_theme,       length: {maximum: 60, message: 'は60文字以内です。'}

  validates :introduction,        length: {maximum: 150, message: 'は150文字以内です。'}

  validates :password,            presence: { message: 'を入力してください。'}, length: { minimum: 6 , message: 'は6文字以上です。'}, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: 'は半角英数です。'}
  # 英数半角記号

  validates :major_id,            presence: { message: 'は必須内容です。' }
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

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
