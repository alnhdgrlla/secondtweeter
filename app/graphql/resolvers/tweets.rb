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
    end
  end
end


