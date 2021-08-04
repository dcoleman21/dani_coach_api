class User < ApplicationRecord
  has_secure_password
  has_secure_token :token

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :cell_phone, presence: true
  validates :signature, presence: true
  validates :internal_email, presence: true
  validates :password, presence: true
  validates :token, uniqueness: true, presence: true
end
