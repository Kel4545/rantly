class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true
end

