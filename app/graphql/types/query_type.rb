class Types::QueryType < Types::BaseObject
# Add root-level fields here.
# They will be entry points for queries on your schema.

field :tweets, resolver: Resolvers::Tweets
field :total_tweets_count, resolver: Resolvers::TotalTweetsCount
field :total_following, resolver: Resolvers::TotalFollowing
field :total_follower, resolver: Resolvers::TotalFollower
end

