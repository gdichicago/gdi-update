class NewsletterGenerator

  attr_reader :meetups, :fetch_events, :fetch_jobs, :gif, :articles

  def initialize(options)
    @meetups = _generate_meetups(options[:fetch_meetups])
    @fetch_events = options[:fetch_events]
    @fetch_jobs = options[:fetch_jobs]
    @intro = options[:introduction]
    @gif = _generate_gif(options[:gif_url])
    @articles = _generate_articles(options[:articles])
  end

  def newsletter
    @newsletter ||= process
  end

  def process
    ::Newsletter.new(meetups, gif, articles)
  end

  def _generate_meetups(fetch_meetups)
    fetch_meetups ? ::Meetup.grab_all : []
  end

  def _generate_gif(gif_url)
    Gif.new(gif_url)
  end

  def _generate_articles(article_array)
    if article_array
      article_array.map { |article_options| ::Article.new(article_options) }
    else
      []
    end
  end

end
