class User < ActiveRecord::Base
  has_many :rants
  accepts_nested_attributes_for :rants
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true
end

def full_name
  "#{firstname} #{lastname}"
end