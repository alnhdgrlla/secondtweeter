module Mutations
  class EditUser < BaseMutation

    argument :username, String, required: true
    argument :bio, String, required: true
    argument :password, String, required: true

    type Types::UserType
    
    def resolve(username:, bio:, password:)
      user = context[:current_user]
      if user.update!(username: username, bio: bio, password: password)
        {
          username: username,
          bio: bio,
          password: password
        }
      else
        put "Following did not finish successfuly. Please try again"
      end
    end
  end
end