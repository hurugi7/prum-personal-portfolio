class User < ApplicationRecord
  has_many :skills
  before_save { email.downcase!}
  has_one_attached :avatar_image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password        
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  validates :introduce_messages, length: { minimum: 200, maximum: 799}
  validates :avatar_image, content_type: { in: %w[image/gif image/jpeg image/png],
                                           message: "には正しい形式を選択してください" },
                           size: { less_than: 5.megabytes,
                                   message: "は5MB以下にしてください" }
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)                                                  
  end
end
