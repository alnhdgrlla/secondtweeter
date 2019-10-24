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
        return GraphQL::ExecutionError.new("Your tweet did not save")
      end
    end
  end
end