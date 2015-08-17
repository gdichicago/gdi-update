class Meetup
  @@api_client ||= MeetupApi.new

  attr_reader :url, :title, :event_datetime, :location, :address, :description

  def initialize(options)
    @url = options["event_url"]
    @title = options["name"]
    @event_datetime = options["time"]
    @location = options["venue"] ? options["venue"]["name"] : ""
    @address = options["venue"] ? options["venue"]["address_1"] : ""
    @description = options["description"]
  end

  def to_html
    "<p><strong>(CLASS) <a href='#{url}'>#{title}</a></strong><br /> #{event_datetime}<br />#{location}  (#{address})</p>"
  end

  def self.fetch_events
    @@api_client.events({group_urlname: "Girl-Develop-It-Chicago-Il"})["results"]
  end

  def self.grab_all
    fetch_events.map { |event| Meetup.new(event) }
  end

  def self.header_html
    "<h3><strong><span style='text-decoration: underline; color: #000000;'>Upcoming GDI Chicago Events</span></strong></h3>"
  end

end
