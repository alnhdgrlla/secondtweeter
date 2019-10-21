module Resolvers
  class TotalFollower < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      user = User.find(user_id)
      count = user.total_follower
      if user.present?
        {
          total_follower: count
        }
      else
        return GraphQL::ExecutionError.new("This user does not exist")
      end
    end
  end
end
