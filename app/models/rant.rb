class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites
  validates :about, presence: true, :length => {:within => 1..40}
 # validates :rant, presence: true, :length => {:minimum => 140}


  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end

end