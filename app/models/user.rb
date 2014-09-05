class User < ActiveRecord::Base
  has_many :rants
  has_secure_password

  validates :username, presence: true, uniqueness: {case_sensitive: false, message: "Username cannot be blank"}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true

  accepts_nested_attributes_for :rants
end