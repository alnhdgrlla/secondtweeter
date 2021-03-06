class Types::RelationshipType < Types::BaseObject
  field :id, ID, null: false
  field :followee_id, ID, null: false
  field :follower_id, ID, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :username, String, null: true
  field :bio, String, null: true
  field :email, String, null: true
end
