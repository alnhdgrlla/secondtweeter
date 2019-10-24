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