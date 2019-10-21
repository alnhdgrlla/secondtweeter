class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :username, String, null: true
  field :bio, String, null: true
  field :email, String, null: true
  field :password, String, null: true
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :total_following, Integer, null: true
  field :total_follower, Integer, null: true
end
