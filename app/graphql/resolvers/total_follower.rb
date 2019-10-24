module Resolvers
  class TotalFollower < Resolvers::Base
    argument :user_id, ID, required: true

    type Types::UserType, null: false

    def resolve(user_id:)
      return GraphQL::ExecutionError.new("This user does not exist") unless User.find_by(id:user_id)
      user = User.find(user_id)
      count = user.total_follower
        {
          total_follower: count
        }
    end
  end
end

# module Resolvers
#   class TotalFollower < Resolvers::Base
#     argument :user_id, ID, required: true

#     type Types::UserType, null: false

#     def resolve(user_id:)
#       if user_id.present?
#         user = User.find(user_id)
#         count = user.total_follower
#         {
#           total_follower: count
#         }
#       else
#         return GraphQL::ExecutionError.new("This user does not exist")
#       end
#     end
#   end
# end

# module Resolvers
#   class TotalFollower < Resolvers::Base
#     argument :user_id, ID, required: true

#     type Types::UserType, null: false

#     def resolve(user_id:)
#       if user = User.find(user_id)
#         user = User.find(user_id)
#         count = user.total_follower
#         {
#           total_follower: count
#         }
#       else
#         return GraphQL::ExecutionError.new("This user does not exist")
#       end
#     end
#   end
# end

