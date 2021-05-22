module QueryTypes
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :publication_date, GraphQL::Types::ISO8601Date, null: true, description: "上架販售的時間"
    field :saled_store, StoreType, null: true, method: :store
    field :publishing_house, PublishingHouseType, null: true
  end
end
