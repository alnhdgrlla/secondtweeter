module Resolvers
  class SpecificUser < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      return GraphQL::ExecutionError.new("This user does not exist") unless User.find_by(id:user_id)
      user = User.find(user_id)
      tweet_count = user.total_tweet
      follower_count = user.total_follower
      following_count = user.total_following
      bio = user.bio
      id = user.id
      username = user.username
      
      # return user 
        {
          tweet_count: tweet_count,
          total_follower: follower_count,
          total_following: following_count,
          bio: bio,
          id: id,
          username: username
        }
    end
  end
end