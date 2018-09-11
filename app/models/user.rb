class User < ApplicationRecord
  #first argument is the name of attributes you wanna validate
  #second argument is a hash of setting
  #of course you can write the hash with {}.
  #e.g. validates(:name, { "presence" => true })

  #callbacks
  before_save { self.email = email.downcase }

  #validations
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }, presence: true
  has_secure_password
end
