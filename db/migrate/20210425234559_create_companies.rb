# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :social_name
      t.string :fantasy_name
      t.string :cnpj
      t.string :ie
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :phone
      t.string :cell_phone
      t.string :email
      t.string :site

      t.timestamps
    end
  end
end
