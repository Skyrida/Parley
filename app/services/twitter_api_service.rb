require "json"
require "open-uri"

class TwitterApiService
  # def initialize
  # end

  # def globalcall
  #   global_ideas = []
  #   world_trend_url = "https://api.twitter.com/1.1/trends/place.json?id=1?exclude=hashtags"
  #   world_trend_serialized = URI.open(world_trend_url).read
  #   world_trends = JSON.parse(world_trend_serialized)
  #   global_ideas << world_trends.first(5)
  # end

  # def localcall
  #   local_ideas = []
  #   local_trend_url = "https://api.twitter.com/1.1/trends/place.json?id=56000398?exclude=hashtags"
  #   local_trend_serialized = URI.open(local_trend_url).read
  #   local_trends = JSON.parse(local_trend_serialized)
  #   local_ideas << local_trends.first(5)
  # end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end
end
