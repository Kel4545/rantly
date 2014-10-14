module ApplicationHelper

  def please_register
   !registered? && visited?
  end

 def visited?
   cookies[:visits] == 1
 end

  def registered?
    cookies[:registered]
  end
end
