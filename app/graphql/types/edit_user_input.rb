class Types::EditUserInput < Types::BaseInputObject
  argument :username, String, required: false
  argument :bio, String, required: false
  argument :password, String, required: false
end