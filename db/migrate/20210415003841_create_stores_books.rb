class CreateStoresBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :stores_books do |t|
      t.references :store
      t.references :book

      t.timestamps
    end
  end
end
