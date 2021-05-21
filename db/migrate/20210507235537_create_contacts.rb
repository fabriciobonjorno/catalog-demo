# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :message
      t.boolean :commercial, default: false
      t.boolean :financial, default: false
      t.boolean :logistic, default: false
      t.boolean :administrative, default: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
