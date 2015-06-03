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
  end

  def most_recent_follower
    client.friends.first
  end

  def find_user_for(username)
    client.user(username)
  end

  def number_of_followers_for(user)
    sleep error.rate_limit.reset_in
    client.followers(user).count
  end

  def find_followers_for(user)
    client.followers(user).take(10)
  end

  def find_followers_names_for(user)
    array = []
    client.followers(user).each{|id| array << id.name}
    array
  end
end
