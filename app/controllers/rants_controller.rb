class RantsController < ApplicationController

  def index
    @rant = Rant.order(:rant)
  end

  def show

  end
end