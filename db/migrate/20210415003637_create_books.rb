class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.date :publication_date
      t.references :user
      t.references :store

      t.timestamps
    end
  end
end
