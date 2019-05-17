class User < ApplicationRecord

has_secure_password
has_secure_token :confirmation_token

before_save { email.downcase! }

  validates :username,
            presence: true,
            length: { maximum: 50 },
            format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que caractères alphanumériques ou des _'},
            uniqueness:  {case_sensitive:  false}
  validates :email,
            presence: true,
            length: { maximum: 200 },
            format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
            uniqueness: {case_sensitive:  false}
  validates :password,
            presence: true,
            length: {minimum: 5}
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
