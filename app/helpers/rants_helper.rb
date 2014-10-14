module RantsHelper

  def favorited?(rant)
   @favorite = Favorite.find_by(rant_id: rant.id, user_id: current_user.id)
  end
end