module UsersHelper

  def full_name(person)
    [person.first_name, person.last_name].join(" ")
  end

  def check_follow(user)
    @follow = Follow.find_by(follower_id: current_user.id, followee_id: user.id)
    @follow == nil ? false : true
  end

  def check_favorite(rant)
    @favorite = Favorite.find_by(user_id: current_user.id, rant_id: rant.id)
  end
end
