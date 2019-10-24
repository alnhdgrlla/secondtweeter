module Resolvers
  class TotalTweetsCount < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::TweetType, null: false

    def resolve(user_id:)
      return GraphQL::ExecutionError.new("This user does not exist") unless User.find_by(id:user_id)
      user = User.find(user_id)
      count = user.total_tweet
        {
          tweet_count: count
        }
    end
  end
end

# module Resolvers
#   class TotalTweetsCount < Resolvers::Base
#     argument :user_id, ID, required: true

#     field :count, Integer, null: true
#     # type Types::TweetType, null: false

#     def resolve(user_id:)
#       user = User.find(user_id)
#       count = user.total_tweet
#       if user
#         {
#           count: count
#         }
#       else
#         return GraphQL::ExecutionError.new("This user does not exist")
#       end
#     end
#   end
# end

# module Resolvers
#   class TotalTweetsCount < Resolvers::Base
#     argument :user_id, ID, required: true

#     field :count, Integer, null: true
#     type Types::TweetType, null: false

#     def resolve(user_id:)
#       user = User.find(user_id)
#       count = user.total_tweet
#       {
#         count: count
#       }
#     end
#   end
# end