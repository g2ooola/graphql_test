module QueryTypes
  class StoreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :secret, String, null: true, description: "Secret Key" do
      visible? -> (context) { super && false }
      # this visible method not working
    end
    field :grade, Enums::Grade, null: true

    def self.visible?(context)
      # only show it to users with the secret_feature enabled
      # # super && context[:viewer].feature_enabled?(:secret_feature)
      # super && false
      puts context.as_json
      super && true
    end
  end
end
