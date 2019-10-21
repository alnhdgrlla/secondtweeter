module Resolvers
  class TotalFollowing < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      user = User.find(user_id)
      count = user.total_following
      if user
        {
          total_following: count
        }
      else
        return GraphQL::ExecutionError.new("This user does not exist")
      end
    end
  end
end
