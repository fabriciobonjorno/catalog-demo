class AddDetachAndActiveToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :detach, :boolean
    add_column :products, :active, :boolean, default: true
  end
end
