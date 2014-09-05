class Rant < ActiveRecord::Base
belongs_to :user
  validates_presence_of :rant, {message: "Your rant could not be created"}

end