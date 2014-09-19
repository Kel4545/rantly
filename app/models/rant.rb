class Rant < ActiveRecord::Base

  belongs_to :user
  validates :about, presence: true, :length => {:within => 1..40}
 # validates :rant, presence: true, :length => {:minimum => 140}

end