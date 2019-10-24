# module Mutations
#   class DeleteTweet < BaseMutation
#     argument :tweet_id, ID, required: true

#     field :id, Types::TweetType, null: true

#     def resolve(tweet_id:)
#       return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user]

#       Tweet.find_by(id:tweet_id).destroy

#     end
#   end
# end

module Mutations
  class DeleteTweet < BaseMutation
    argument :tweet_id, ID, required: true

    field :id, Types::TweetType, null: true
    field :content, Types::TweetType, null: true

    def resolve(tweet_id:)
      return GraphQL::ExecutionError.new("This is not your tweet") if !context[:current_user]
      tweet = Tweet.find_by(id:tweet_id)
      if tweet.present?
        tweet.destroy
        {
          id: tweet,
          content: tweet
        }
      else
       return GraphQL::ExecutionError.new("This tweet does not exist")
      end
    end
  end
end

# module Mutations
#   class DeleteTweet < BaseMutation

#     argument :tweet_id, ID, required: true

#     field :id, Types::TweetType, null: false
#     field :content, Types::TweetType, null: false
#     field :error, String, null: false


#     def resolve(tweet_id:)
#       tweet = Tweet.find(tweet_id)
#       content = tweet.content
#       error_msg = GraphQL::ExecutionError.new("cannot delete the same tweet twice")

#       if tweet.present?
#         if context[:current_user] == tweet.user
#           tweet.destroy if 
#           {
#             id: tweet_id,
#             content: content
#           }
#         end
#       else
#         {
#           error: error_msg
#         }
#       end
#     end
#   end
# end

# module Mutations
#   class DeleteTweet < BaseMutation

#     argument :tweet_id, ID, required: true

#     field :id, Types::TweetType, null: false
#     field :content, Types::TweetType, null: false
#     field :error, String, null: false


#     def resolve(tweet_id:)
#       if Tweet.find_by(tweet_id)
#         tweet = Tweet.find(tweet_id)
#         content = tweet.content

#         if context[:current_user] == tweet.user
#           tweet.destroy if 
#           {
#             id: tweet_id,
#             content: content
#           }
#         end
#       else
#         {
#           error: GraphQL::ExecutionError.new("cannot delete the same tweet twice")
#         }
#       end
#     end
#   end
# end


# module Mutations
#   class DeleteTweet < BaseMutation
#     argument :tweet_id, ID, required: true
    
#     field :id, Types::TweetType, null: true
#     field :content, Types::TweetType, null: true

#     def resolve(tweet_id:)
#       return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user]

#       tweet = Tweet.find_by!(id:tweet_id)
#       tweet.destroy
#       {
#         id: tweet.id,
#         content: tweet.content
#       }
#     end
#   end
# end