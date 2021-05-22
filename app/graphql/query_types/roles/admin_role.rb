module QueryTypes
  module Roles
    class AdminRole < BaseRole

      field :current_admin, AdminType, null: true
      field :books, [BookType], null: false do
        argument :name, String, required: false, default_value: ''
        argument :date, GraphQL::Types::ISO8601Date, required: false, deprecation_reason: "Use `publication_date` instead."
        argument :publication_date, GraphQL::Types::ISO8601Date, required: false
        argument :store_id, ID, required: false, prepare: ->(startDate, ctx) {
          # return the prepared argument.
          # raise a GraphQL::ExecutionError to halt the execution of the field and
          # add the exception's message to the `errors` key.
        }
      end
      field :users, [UserType], null: true do
        argument :name, String, required: false
        argument :email, String, required: false
        argument :tel, String, required: false
      end

      def current_admin
        context[:current_admin]
      end

      def books(**args)
        name = args[:name]
        publication_date = args[:publication_date]

        books = Book
        books = books.where("name like ?", "%#{name}%") if name.present?
        books = books.where(publication_date: publication_date) if publication_date.present?
        books = books.limit(3)
      end

      def users(**args)
        users = User
        users = users.where("name like ?", args[:name]) if args[:name].present?
        users = users.where("email like ?", args[:email]) if args[:email].present?
        users = users.where("tel like ?", args[:tel]) if args[:tel].present?
        users = users.limit(3)
      end

    end
  end
end