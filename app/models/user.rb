class User < ApplicationRecord
  has_secure_password

  has_one  :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password,
            length: { minimum: 6 }

  validates :first_name, :last_name,
            length: { minimum: 3 },
            presence: true

  validates :phone_number,
            length: { in: 3..20 }
end
