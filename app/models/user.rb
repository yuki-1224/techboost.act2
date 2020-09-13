class User < ApplicationRecord
  has_secure_password

  EMAIL_REGULAR = /\A([^@\s]+)@[a-zA-Z0-9]+\.[a-zA-Z0-9-\.]+\z/
  PASS_REGULAR = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/

  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGULAR}
  validates :password, presence: true, format: {with: PASS_REGULAR}

  has_secure_password

  has_many :topics
end
