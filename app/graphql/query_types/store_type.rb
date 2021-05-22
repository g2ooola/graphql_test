module QueryTypes
  class StoreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :grade, Enums::Grade, null: true
  end
end
