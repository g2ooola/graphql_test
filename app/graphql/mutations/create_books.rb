module Mutations
  class CreateBooks < BaseMutation

    # argument :input, String
    argument :name, String, required: true
    # argument :name, String, required: true, default_value: ''
    # argument :store_id, ID, required: true # 若其參數名為 [type]_id, 可不必加 loads 參數
    # argument :buyer_id, ID, required: true, loads: Types::User
    # argument :publishing, ID, required: false, as: :publishing

    # 使用 tyep 關鍵字來定義回傳
    # ref : https://www.howtographql.com/graphql-ruby/3-mutations/
    # type QueryTypes::BookType

    # # 使用官方範例的 field 會導致 發過來的 query 長得很奇怪
    # # ref : https://graphql-ruby.org/mutations/mutation_classes.html
    field :book, QueryTypes::BookType, null: true
    field :name, String, null: true


    # # 參數 publishing 沒有 id 結尾，需要 load_[參數名] 的 method 來做自動讀取
    # # ( or 你也可以捨棄自動讀取 )
    # def load_employee(id)
    #   PublishingHouse.find(id) if id.present?
    # end
    
    # # 在開始執行任何動作前先判斷，若是 fails 直接中斷，不會從 db 讀資料
    # def ready?(**args)
    #   # 不論在哪直接 raise 會回傳 500
    #   raise 'Must be admin!' unless !context[:current_admin]
    #   true
    # end

    # def resolve(name:, store:, buyer:, publishing:)
    #   book = Book.create!(
    #     name: name,
    #     store: store,
    #     user: buyer,
    #     publishing_house: publishing)
    # end

    def resolve(name:)
      return {
        name: name,
        book: Book.first
      }
    end
  end
end