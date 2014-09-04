class RantsController < ApplicationController

  def show
    @rant = Rant.order(:rant)
  end
end