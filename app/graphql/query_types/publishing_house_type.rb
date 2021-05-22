module QueryTypes
  class PublishingHouseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true, description: "名稱"
    field :tel, String, null: true, description: "聯絡電話"

    def self.authorized?(object, context)
      # super && (object.to_friend == context[:viewer] || object.from_friend == context[:viewer])
      super && context[:current_admin].present?
    end
  end
end