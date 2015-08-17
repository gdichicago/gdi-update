class Gif
  DEFAULT_HEIGHT = 200  

  attr_reader :url, :height

  def initialize(url, height=DEFAULT_HEIGHT)
    @url = url
    @height = height
  end

  def to_html
    "<p><img src='#{url}' height='#{height}'</p>"
  end
end
