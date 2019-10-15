module Resolvers
  class Tweets < Resolvers::Base
    type [Types::TweetType], null: false

    argument :user_id, ID, required: false
    argument :feed, String, required: false


    def resolve(user_id: nil, feed: nil)
      c_user = context[:current_user]

      tweets  = Tweet.all
      tweets = Tweet.where(user_id: c_user.id)
            .or(Tweet.where(user_id: c_user.active_relationships.select(:followee_id))) if feed
      tweets = Tweet.where(user_id: user_id) if user_id
      tweets
    end
  end
end


