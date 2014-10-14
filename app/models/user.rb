class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :firstname, :lastname, :bio, :frequency, :password, presence: true
  validates :password, :length => {:within => 8..40}
  # validates :image, presence: true
end


