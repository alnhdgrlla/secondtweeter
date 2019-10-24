class Types::QueryType < Types::BaseObject
# Add root-level fields here.
# They will be entry points for queries on your schema.

field :tweets, resolver: Resolvers::Tweets
field :user_info, resolver: Resolvers::UserInfo
# field :total_following, resolver: Resolvers::TotalFollowing
# field :total_follower, resolver: Resolvers::TotalFollower
# field :specific_user, resolver: Resolvers::SpecificUser
# field :follower_followee, resolver: Resolvers::FollowerFollowee
end

