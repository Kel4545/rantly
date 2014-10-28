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

  def dat_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :no_intra_emphasis => true)
    markdown.render(text).html_safe
  end
end
