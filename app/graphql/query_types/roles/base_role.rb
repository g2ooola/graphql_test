module QueryTypes
  module Roles
    class BaseRole < Types::BaseObject
      # 避免直接將 field 跟 ActiveRecord 聯繫
      include GraphQL::Types::Relay::HasNodeField
      include GraphQL::Types::Relay::HasNodesField
    end
  end
end