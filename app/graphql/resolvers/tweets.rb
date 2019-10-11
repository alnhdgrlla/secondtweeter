module Resolvers
  class Tweets < Resolvers::Base
    type [Types::TweetType], null: false

    def resolve
      Tweet.all
    end
  end
end