require 'twitter'
require 'yaml'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end

    @username = "artross_test"
  end

  def most_recent_follower
    # find the Twitter gem method that accomplishes this!
    @client.followers(@username).to_a.last
  end

  def find_user_for(username)
    # find the Twitter gem method that accomplishes this!
    @client.user(@username)
  end

  def find_followers_for(user)
    # find the Twitter gem method that accomplishes this, and limit it to 10 followers only!
    @client.followers(@username).each_with_index.select { |e, i| e if i <= 10 }
  end
end
