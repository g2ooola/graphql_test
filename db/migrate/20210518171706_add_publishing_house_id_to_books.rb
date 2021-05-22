class AddPublishingHouseIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :publishing_house
  end
end
