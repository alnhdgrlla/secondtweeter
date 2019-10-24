class Types::BaseSchemaArgument < GraphQL::Schema::Argument
  # Override #initialize to take a new argument:
  def initialize(*args, role_restrict: nil, **kwargs, &block)
    @role_restrict = role_restrict
    # Pass on the default args:
    super(*args, **kwargs, &block)
  end

  def to_graphql
    field_defn = super # Returns a GraphQL::Field
    field_defn.metadata[:role_restrict] = @role_restrict
    field_defn
  end

  def visible?(context)
    return context[:current_user].is_a?(@role_restrict) if @role_restrict
    super
  end
end