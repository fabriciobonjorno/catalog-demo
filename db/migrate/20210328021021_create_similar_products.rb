# frozen_string_literal: true

class CreateSimilarProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :similar_products do |t|
      t.string :code
      t.string :ean
      t.string :dun
      t.string :display
      t.string :description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
