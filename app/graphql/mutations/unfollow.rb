module Mutations
  class Unfollow < BaseMutation

    argument :followee_id, ID, required: true

    field :follower, Types::UserType, null: true
    field :followee, Types::UserType, null: true
    field :error, String, null: false

    def resolve(followee_id:)
      follower = context[:current_user]
      followee = User.find(followee_id)
      error_msg = GraphQL::ExecutionError.new("cannot unfollow the  same user twice")
      if follower.unfollow(followee)
        {
         follower: follower,
         followee: followee
        }
      else
        {
        error: error_msg
        }
      end
    end
  end
end

# module Mutations
#   class Unfollow < BaseMutation

#     argument :followee_id, ID, required: true

#     field :follower, Types::UserType, null: false
#     field :followee, Types::UserType, null: false
#     field :error, String, null: false

#     def resolve(followee_id:)
#       follower = context[:current_user]
#       followee = User.find(followee_id)
#       error_msg = follower.errors.full_message(:title, "cannot unfollow the  same user twice")
#       follower.unfollow(followee)
#         {
#           follower: follower,
#           followee: followee
#         }
#         rescue ActiveRecord::RecordNotFound
#           raise GraphQL::ExecutionError, "Invalid informations"
#     end
#   end
# end