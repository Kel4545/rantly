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

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, highlight: true)
    markdown.render(text).html_safe
  end
end
