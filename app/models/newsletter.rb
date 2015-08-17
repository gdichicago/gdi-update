class Newsletter

  attr_reader :meetups, :gif, :articles, :html, :parsed_html
  def initialize(meetups, gif, articles)
    @meetups = meetups
    @gif = gif
    @articles = articles || []
    @html = _generate_html
    @parsed_html = _parse_html
  end

  def header_html
    "<h2><strong><span style='color: #f05b62;'>GIRL DEVELOP IT CHICAGO BI-WEEKLY UPDATE</span></strong></h2><br/>"
  end

  def signature_html
    "<p><span>Love,</span><br /> <a href='https://twitter.com/kathryn_ex'>Katy</a> &amp; <a href='https://twitter.com/paigecrum'>Paige</a><br /> <span>Girl Develop It Chicago</span><br/><p><em>Don't forget to follow Girl Develop It on <a href='https://twitter.com/gdichicago'>Twitter</a> and <a href='https://www.facebook.com/GDIChicago'>Facebook</a>!</em></p></p>"
  end

  def _generate_html
    header_html +
    ::Meetup.header_html +
    meetups.map(&:to_html).join("") +
    ::Article.header_html +
    ::Article.to_html(articles) +    
    gif.to_html +
    signature_html
  end

  def _parse_html
    ::HtmlCleaner.clean(html)
  end

end
