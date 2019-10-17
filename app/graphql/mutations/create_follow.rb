module Mutations
  class CreateFollow < BaseMutation

    argument :followee_id, ID, required: true

    field :follower, Types::UserType, null: false
    field :followee, Types::UserType, null: false
    

    def resolve(followee_id:)
      follower = context[:current_user]
      followee = User.find(followee_id)
      if follower.follow(followee)
        {
          follower: follower,
          followee: followee
        }
      else
        raise GraphQL::ExecutionError, follower.errors.full_messages.join(", ")
      end
    end
  end
end

# module Mutations
#   class CreateFollow < BaseMutation

#     argument :followee_id, ID, required: true

#     field :follower, Types::UserType, null: false
#     field :followee, Types::UserType, null: false
    

#     def resolve(followee_id:)
#       follower = context[:current_user]
#       followee = User.find(followee_id)
#       if follower.follow(followee)
#         {
#           follower: follower,
#           followee: followee
#         }
#       else
#         rescue ActiveRecord::RecordInvalid => e
#           GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
#       end
#     end
#   end
# end


  
