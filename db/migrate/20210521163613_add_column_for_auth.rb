class AddColumnForAuth < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level, :integer, default: 0
    add_column :users, :secret, :string
    add_column :admins, :secret, :string
  end
end
