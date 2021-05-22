module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :role_user, QueryTypes::Roles::UserRole, null: true do 
      description "Auth current user"
      argument :secret, String, required: false
    end

    field :role_admin, QueryTypes::Roles::AdminRole, null: true do
      description "Auth current admin"
      argument :secret, String, required: false
    end

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    def role_user(secret:)
      if !Rails.env.production? && secret.present?
        context[:current_user] = User.find_by(secret: secret)
      end

      context[:current_user]
    end

    def role_admin(secret:)
      if !Rails.env.production? && secret.present?
        context[:current_admin] = Admin.find_by(secret: secret)
      end

      context[:current_admin]
    end
  end
end
