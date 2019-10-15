module Resolvers
  class Tweets < Resolvers::Base
    type [Types::TweetType], null: false

    def resolve
      Tweet.where(user_id: context[:current_user].id)
    end
  end
end