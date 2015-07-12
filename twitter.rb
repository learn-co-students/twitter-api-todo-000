require 'twitter'
require 'yaml'

require "pry"

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
    client.followers.first
  end

  def find_user_for(username)
    client.user(username)
  end

  def find_followers_for(user)
    answer_array = []
    client.followers(user).collect do |follower|
      answer_array<<follower
    end
    answer_array

    # binding.pry
    # find the Twitter gem method that accomplishes this, and limit it to 10 followers only!
  end
end
