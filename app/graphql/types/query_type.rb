module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # field :user, UserType, null: true do
    field :user, QueryTypes::UserType, null: true do 
      description "Find a user by ID"
      argument :id, ID, required: true
    end

    field :current_admin, QueryTypes::AdminType, null: true do
      description "Find current admin"
      argument :id, ID, required: true
    end

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    def user(id:)
      User.find(id)
    end

    def current_admin(id:)
      Admin.find(id)
    end
  end
end
