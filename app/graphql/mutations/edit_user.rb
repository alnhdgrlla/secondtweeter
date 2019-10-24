# module Mutations
#   class EditUser < BaseMutation

#     argument :username, String, required: false
#     argument :bio, String, required: false
#     argument :password, String, required: false

#     type Types::UserType
    
#     def resolve(username: nil, bio: nil, password: nil)
#       user = context[:current_user]
#       info = { username: username, bio: bio, password: password }
#       info.reject!{|key,value| value == nil}
#       if user.update!(info)
#         info
#       end
#     end
#   end
# end

# module Mutations
#   class EditUser < BaseMutation

#     argument :update_args, Types::UserType, required: true

#     # argument :username, String, required: false
#     # argument :bio, String, required: false
#     # argument :password, String, required: false

#     type Types::UserType
    
#     def resolve(username: nil, bio: nil, password: nil)
#       user = context[:current_user]
#       info = { username: username, bio: bio, password: password }
#       info.reject!{|key,value| value == nil}
#       if user.update!(info)
#         info
#       end
#     end
#   end
# end

# module Mutations
#   class EditUser < BaseMutation

#     argument :update_args, Types::EditUserInput, required: true

#     type Types::UserType
    
#     def resolve(update_args: nil)
#       user = context[:current_user]
#       info = { username: update_args["username"], bio: update_args["bio"], password: update_args["password"] }
#       info.reject!{|key,value| value == nil}
#       if user.update!(info)
#         info
#       end
#     end
#   end
# end

module Mutations
  class EditUser < BaseMutation

    argument :update_args, Types::EditUserInput, required: true

    type Types::UserType
    
    def resolve(update_args: nil)
      user = context[:current_user]
      info = { username: update_args[:username], bio: update_args[:bio], password: update_args[:password] }
      info.reject!{|key,value| value == nil}
      if user.update!(info)
        info
      end
    end
  end
end