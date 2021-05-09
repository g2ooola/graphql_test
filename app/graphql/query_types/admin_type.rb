module QueryTypes
  class AdminType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false, validates: { format: { with: /\w+@\w+\.\w+/ } }
    field :search_books, [BookType], null: false do
      argument :name, String, required: false, default_value: ''
      argument :date, GraphQL::Types::ISO8601Date, required: false, deprecation_reason: "Use `publication_date` instead."
      argument :publication_date, GraphQL::Types::ISO8601Date, required: false
      argument :store_id, ID, required: false, prepare: ->(startDate, ctx) {
        # return the prepared argument.
        # raise a GraphQL::ExecutionError to halt the execution of the field and
        # add the exception's message to the `errors` key.
      }
    end

    def search_books(**args)
      name = args[:name]
      publication_date = args[:publication_date]
      # publication_date = args[:date]

      books = Book
      books = books.where("name like ?", "%#{name}%") if name.present?
      books = books.where(publication_date: publication_date) if publication_date.present?
      books = books.limit(3)
    end
  end
end