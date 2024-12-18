# frozen_string_literal: true

class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :description
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
