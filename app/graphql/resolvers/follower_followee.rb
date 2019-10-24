module Resolvers
  class FollowerFollowee < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      return GraphQL::ExecutionError.new("This user does not exist") unless User.find_by(id:user_id)
      user = User.find(user_id)
      # followee = user.followees
      # follower = user.followers
      # {
      #   followees: followee,
      #   followers: follower,
      # }
    end
  end
end