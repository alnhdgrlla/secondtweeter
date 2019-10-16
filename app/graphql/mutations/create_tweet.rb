module Mutations
  class CreateTweet < BaseMutation

    argument :content, String, required: true

    type Types::TweetType

    def resolve(content:)
      tweet = Tweet.new(
        content: content,
        user: context[:current_user]
      )
      if tweet.save
        tweet
      else
        puts "Your tweet did not save. Please try again"
      end
    end
  end
end

# module Mutations
#   class CreateTweet < BaseMutation

#     argument :content, String, required: true

#     field :tweet, Types::TweetType, null: false

#     def resolve(content:)
#       tweet = Tweet.new(
#         content: content,
#         user: context[:current_user]
#       )
#       if tweet.save
#         return {tweet: tweet}
#       end
#     end
#   end
# end