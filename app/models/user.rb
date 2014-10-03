class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :firstname, :lastname, :bio, :frequency, :password, presence: true
  validates :password, :length => {:within => 8..40}
end

