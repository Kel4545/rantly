class User < ActiveRecord::Base

  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :rants, dependent: :destroy
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_many :comments
  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :firstname, :lastname, :bio, :frequency, :password, presence: true
  validates :password, :length => {:within => 8..40}


  def generate_sign_in_token
    self.sign_in_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end

