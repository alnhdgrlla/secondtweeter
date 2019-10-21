module Mutations
  class CreateFollow < BaseMutation

    argument :followee_id, ID, required: true

    field :follower, Types::UserType, null: true
    field :followee, Types::UserType, null: true
    field :error, String, null: false


    def resolve(followee_id:)
      follower = context[:current_user]
      followee = User.find(followee_id)
      error_msg = GraphQL::ExecutionError.new("cannot follow the  same user twice")
      if follower.follow(followee)
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


  
