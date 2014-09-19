class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true, :length => {:within => 8..40}
end

