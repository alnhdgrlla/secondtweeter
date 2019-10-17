module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
    field :create_tweet, mutation: Mutations::CreateTweet
    field :create_follow, mutation: Mutations::CreateFollow
    field :unfollow, mutation: Mutations::Unfollow
    field :edit_user, mutation: Mutations::EditUser
    field :delete_tweet, mutation: Mutations::DeleteTweet
  end
end
