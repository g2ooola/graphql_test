module QueryTypes
  module Roles
    class UserRole < BaseRole
      field :current_user, UserType, null: true
      def current_user
        context[:current_user]
      end
    end
  end
end