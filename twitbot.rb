require 'yaml'
require 'rss'

class Twitbot
  URL = ENV['TWITBOT_URL']

  attr_reader :tweet, :post, :logger

  def initialize(client, url = URL, logger=Logger.new(STDOUT))
    open(URL) { |rss| @feed = RSS::Parser.parse(rss) }

    @client = client
    @logger = logger
  end

  def update!
    begin
      logger.info("Tweeting.. #{post[:title]} - #{post[:link]}")
      @client.update "#{post[:title]} - #{post[:link]}"
      logger.info("OK!")
    rescue => e
      logger.warn("Ops! Something went wrong #{e.inspect}")
    end
  end

  protected
  def post
    @valid ||= valid_posts.first

    {
      :title => @valid.title,
      :link => @valid.link
    }
  end

  def items
    @feed.items
  end

  def tweet
    @client.user_timeline.first
  end

  # Returns String:
  # => http://www.yourdomain.com/posts/4321
  #
  def fetch_expanded_url
    @url ||= tweet.urls.first[:expanded_url].to_s
  end

  # Returns only the valid posts for a new tweet
  # (avoid post duplication)
  def valid_posts
    items.keep_if { |item| item.link != fetch_expanded_url }.shuffle!
  end
end
