module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class(Types::BaseSchemaArgument)
  end
end
