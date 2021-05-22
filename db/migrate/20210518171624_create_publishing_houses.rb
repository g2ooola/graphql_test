class CreatePublishingHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :publishing_houses do |t|
      t.string :name
      t.string :tel

      t.timestamps
    end
  end
end
