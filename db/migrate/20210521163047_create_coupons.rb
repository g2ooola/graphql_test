class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :name
      t.references :user, null: true
      t.integer :discount, default: 0, null: false, unsigned: true

      t.timestamps
    end
  end
end
