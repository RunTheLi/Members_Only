class User < ApplicationRecord
  has_secure_password
  
  has_many :posts, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true, uniquesness: true
end
