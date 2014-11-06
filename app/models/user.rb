class User < ActiveRecord::Base
  before_create { generate_remember_token(:remember_token) }

  has_secure_password
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :rants, dependent: :destroy
  has_many :follows, foreign_key: :follower_id
  has_many :follows, foreign_key: :followee_id
  has_many :comments
  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :firstname, :lastname, :bio, :frequency, :password, presence: true
  validates :password, :length => {:within => 8..40}

  def self.authenticate_user(email, password)
    user = find_by_email(email)
    if user && user.authenticate(password)
      user if user.confirmed
    else
      nil
    end
  end

  def send_confirmation
    self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
    self.update_column(:password_reset_sent_at, Time.zone.now)
    UserMailer.send_confirmation_mail(self).deliver
  end

  protected

  def generate_remember_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end

