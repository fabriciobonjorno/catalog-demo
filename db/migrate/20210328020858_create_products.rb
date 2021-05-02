# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :ean
      t.string :dun
      t.string :display
      t.string :description
      t.references :family, null: false, foreign_key: true
      t.references :tax_classification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
