module Mutations
  class Unfollow < BaseMutation

    argument :followee_id, ID, required: true

    field :follower, Types::UserType, null: false
    field :followee, Types::UserType, null: false
    

    def resolve(followee_id:)
      follower = context[:current_user]
      followee = User.find(followee_id)
      if follower.unfollow(followee)
        {
          follower: follower,
          followee: followee
        }
      else
        ######3
      end
    end
  end
end