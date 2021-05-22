module QueryTypes
  class CouponType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :user, UserType, null: true
    field :discount, Integer, null: true

    def self.visible?(context)
      # only show it to users with the secret_feature enabled
      # # super && context[:viewer].feature_enabled?(:secret_feature)
      super && false
    end
  end
end
