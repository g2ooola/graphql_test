module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    # Pass `field ..., require_admin: true` to reject non-admin users from a given field
    # def initialize(*args, **kwargs, require_admin: false, &block)
    def initialize(*args, **kwargs, &block)
      # @require_admin = (kwargs[:arguments] || {})[:require_admin]
      @require_admin = kwargs.delete(:require_admin)
      super(*args, **kwargs, &block)
    end

    def authorized?(obj, args, ctx)
      # if `require_admin:` was given, then require the current user to be an admin
      super && (@require_admin ? ctx[:current_admin].present? : true)
    end
  end
end
