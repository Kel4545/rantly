class RantsController < ApplicationController

  def show
    @rant = Rant.order(:name)
  end
end