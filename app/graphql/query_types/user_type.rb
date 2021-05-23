module QueryTypes
  class UserType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :tel, String, null: true
    field :public, Boolean, null: true
    field :coupons, [CouponType], null: true

    field :level, Integer, null: true, description: "User Level" do
      visible? -> (context) { super && false }
      # this visible method not working
    end

    field :books, BookType.connection_type, null: false, max_page_size: 3 do
      argument :name, String, required: false, default_value: ''
      argument :publication_date, GraphQL::Types::ISO8601Date, required: false
      validates required: {
        one_of: [:name, :publication_date],
        message: 'May use either name or publication_date, but not both.'
      }
    end

    def books(name: nil, publication_date: nil)
      books = object.books
      books = books.where(name: name) if name.present?
      books = books.where(publication_date: publication_date) if publication_date.present?

      books
    end

    def self.authorized?(object, context)
      # super && (object.to_friend == context[:viewer] || object.from_friend == context[:viewer])
      super && (
        context[:current_admin].present? ||
        object.public ||
        context[:current_user].id == object.id
      )
    end
  end
end
