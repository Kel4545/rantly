class RantsController <  ApplicationController

  def index
    @rants = Rant.order(:rant)
  end

end