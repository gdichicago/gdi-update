class Meetup

  attr_reader :url, :title, :event_datetime, :location, :address, :description
 
  def to_html
    ""
  end

  def self.grab_all
    []
  end

  def self.header_html
    "<h3><strong><span style='text-decoration: underline; color: #000000;'>Upcoming GDI Chicago Events</span></strong></h3>"
  end

end
