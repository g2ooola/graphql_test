module QueryTypes
  class AdminType < Types::BaseObject
    field :id, ID, null: false

    # 若要回傳的 email 沒通過 validates，則這個 field 視為 nil
    #   若此時 null: true,  則此 field 會回傳 nil
    #   若此時 null: false, 因為兩者衝突導致整個 type 錯誤，整個 type 回傳 nil
    # 以上兩個狀況都會有錯誤訊息
    field :email, String, null: true #, validates: { format: { with: /\w+@\w+\.\w+/ } }
  end
end