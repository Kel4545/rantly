class RootController < ApplicationController
  layout "root"

  def show
   number_of_visits
  end

  private

  def number_of_visits
    visits
    cookies.permanent[:visits] ||= 0
  end

  def visits
    cookies.permanent[:visits] = cookies.permanent[:visits].to_i + 1 if cookies[:visits]
  end
end

