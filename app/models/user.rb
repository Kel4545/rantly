class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :firstname, presence: true, uniqueness: {case_sensitive: false}
  validates :lastname, presence: true, uniqueness: {case_sensitive: false}
end