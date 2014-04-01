Twitbot
=======

Twitbot is a tiny sinatra app that uses an feed to post rendom tweets.

Configure
---
To configure it, just set the following ENV variables:

    ENV['TWITBOT_URL'] = 'http://www.yourdomain.com/feeds.rss'

    ENV['TWITTER_CONSUMER_KEY'] = 'your-twitter-consumer-key'
    ENV['TWITTER_CONSUMER_SECRET'] = 'your-twitter-consumer-secret'
    ENV['TWITTER_OAUTH_TOKEN'] = 'your-twitter-oauth-token'
    ENV['TWITTER_OAUTH_TOKEN_SECRET'] = 'your-twitter-oauth-token-secret'

Installation
---
Just run: `bundle install`

Running
---
`ruby app.rb`


Enjoy it! ;)
