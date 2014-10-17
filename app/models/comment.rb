class Comment < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :rant, foreign_key: :rant_id
  validates :comment, presence: true
end