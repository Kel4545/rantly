class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :follows
  validates :username, uniqueness: {case_sensitive: false}
  validates :username, :firstname, :lastname, :bio, :frequency, :password, presence: true
  validates :password, :length => {:within => 8..40}
  # validates :image, presence: true


  def create_image(image)
    Image.create!(
      user_id: id,
      filename: image.first.original_filename,
      content_type: image.first.content_type,
      data: image.first.read
    ) if image
  end
end


