class User < ActiveRecord::Base

  validates :username, presence: true, length: { maximum: 40 }
  validates :email, presence: true, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :password, presence: true
end