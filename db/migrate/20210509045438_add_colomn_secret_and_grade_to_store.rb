class AddColomnSecretAndGradeToStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :secret, :string
    add_column :stores, :grade, :integer, limit: 1
  end
end
