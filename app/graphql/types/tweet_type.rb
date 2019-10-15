class Types::TweetType < Types::BaseObject
  field :id, ID, null: false
  field :user, Types::UserType, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :content, String, null: true
end
