# frozen_string_literal: true

class CreateTaxClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_classifications do |t|
      t.string :description

      t.timestamps
    end
  end
end
