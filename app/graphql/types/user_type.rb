class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :username, String, null: false
  field :bio, String, null: false
  field :email, String, null: false
  field :password, String, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
end
