class HtmlCleaner

  def self.clean(html_string)
    return "" if html_string.empty?
    html_string.gsub!("<", "&lt;")
    html_string.gsub!(">", "&gt;")
  end

end
