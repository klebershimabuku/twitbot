require 'sinatra'
require 'twitter'
require './twitbot'

get '/' do

  client = Twitter::REST::Client.new do |config|
    config.consumer_key         = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret      = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token         = ENV['TWITTER_OAUTH_TOKEN']
    config.access_token_secret  = ENV['TWITTER_OAUTH_TOKEN_SECRET']
  end

  logger.info 'client connected..'
  twitbot = Twitbot.new(client)
  logger.info 'twitbot initialized...'
  twitbot.update!
  logger.info 'errors:'
  logger.info twitbot.errors

  logger.info "--- end ---"
end
