# frozen_string_literal: true

class AddDetachAndActiveToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :detach, :boolean, default: false
    add_column :products, :active, :boolean, default: true
  end
end
