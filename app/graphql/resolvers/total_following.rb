module Resolvers
  class TotalFollowing < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      return GraphQL::ExecutionError.new("This user does not exist") unless User.find_by(id:user_id)
      user = User.find(user_id)
      count = user.total_following
        {
          total_following: count
        }
    end
  end
end
