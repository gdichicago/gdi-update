class Article

  attr_reader :url, :description, :tag

  def initialize(options)
    @url = [options[:url]]
    @description = [options[:description]]
    @tag = "#[options[:tag]]"
  end

  def self.header_html
    "<h3><span style='text-decoration: underline;'><strong>Little Bits of LOVE from Katy and Paige</strong></span></h3>"
  end

  def self.to_html(articles)
    html = "</ul>"
    articles.each do |a|
      html += "<li>#{a.tag}: <a href='#{a.url}'>#{a.description}</a></li>"
    end
    html += "</ul>"
  end

end
