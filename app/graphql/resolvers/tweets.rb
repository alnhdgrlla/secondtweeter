module Resolvers
  class Tweets < Resolvers::Base
    type [Types::TweetType], null: false

    argument :user_id, ID, required: false


    def resolve(user_id: nil)
      c_user = context[:current_user]


      if user_id
        Tweet.where(user_id: user_id)
      else
        c_user.feed
      end

      # tweets  = Tweet.all
      # tweets = Tweet.where(user_id: c_user.id)
      #       .or(Tweet.where(user_id: c_user.active_relationships.select(:followee_id)))
      # tweets = Tweet.where(user_id: user_id) if user_id
    end
  end
end


