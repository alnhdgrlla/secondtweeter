module Mutations
  class DeleteTweet < BaseMutation

    argument :tweet_id, ID, required: true

    type Types::TweetType

    def resolve(tweet_id:)
      tweet = Tweet.find(tweet_id)
      if  context[:current_user] == tweet.user
        tweet.destroy
      end
    end
  end
end