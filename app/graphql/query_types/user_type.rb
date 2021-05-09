module QueryTypes
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :tel, String, null: true
    field :books, [BookType], null: true
    field :search_books, [BookType], null: false do
      argument :name, String, required: false, default_value: ''
      argument :publication_date, GraphQL::Types::ISO8601Date, required: false
      argument :limit, Integer, required: false, default_value: 20, prepare: ->(limit, ctx) {[limit, 30].min}
      validates required: {
        one_of: [:name, :publication_date],
        message: 'May use either name or publication_date, but not both.'
      }
    end

    def search_books(name: nil, publication_date: nil, limit:)
      books = Book.where(user_id: object.id).limit(limit)
      if name.present?
        books.where(name: name)
      else
        books.where(publication_date: publication_date)
      end
    end
  end
end
