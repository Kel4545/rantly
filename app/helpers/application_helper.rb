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

  def hashtag_search(text)
    hashtag = text.scan(/#\w+/)
    hashtag.each { |tag|
      unless tag == '#39'
        url = tag.gsub('#', '')
        text.gsub!(tag, "<a href='/searches?utf8=✓&search=#{url}'>#{tag}</a>")
      end
    }
    text.html_safe
  end
end
