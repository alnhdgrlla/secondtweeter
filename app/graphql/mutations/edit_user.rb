module Mutations
  class EditUser < BaseMutation

    argument :user_id, String, required: true
    argument :username, String, required: true
    argument :bio, String, required: true
    argument :password, String, required: true

    type Types::UserType
    
    def resolve(user_id:, username:, bio:, password:)
      user = User.find(user_id)
      user.update!(username: username, bio: bio, password: password) if user == context[:current_user]
        {
          username: username,
          bio: bio,
          password: password
        }
    end
  end
end