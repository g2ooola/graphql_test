module Types
  class MutationType < Types::BaseObject
    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    # field :create_book, mutation: Mutations::CreateBooks
    field :create_book, mutation: Mutations::CreateBooks do
      argument :name, String, required: true
    end
    # field :create_book, QueryTypes::BookType, null: true
    # def create_bookcreate_book
    #   "create_book"
    # end
  end
end
