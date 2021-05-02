# frozen_string_literal: true

class AddQuantitieToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quantitie, :string
  end
end
