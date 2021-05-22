module QueryTypes
  module Roles
    class UserRole < BaseRole
      field :current_user, UserType, null: true
      def current_user
        context[:current_user]
      end

      field :users, [UserType], null: true do
        argument :id, ID, required: false
        argument :name, String, required: false
        argument :email, String, required: false
        argument :tel, String, required: false
      end

      field :user, UserType, null: true do
        argument :id, ID, required: true
      end

      # 可以搜尋 user
      # 但只有在搜尋的全部 user 都符合他的 authorize? method 才會出現
      # 不然只會回傳 null
      def users(**args)
        users = User
        users = users.where(id: args[:id]) if args[:id].present?
        users = users.where("name like ?", args[:name]) if args[:name].present?
        users = users.where("email like ?", args[:email]) if args[:email].present?
        users = users.where("tel like ?", args[:tel]) if args[:tel].present?
        users = users.limit(3)
      end

      def user(**args)
        user = User.find_by(id: args[:id])
      end
    end
  end
end