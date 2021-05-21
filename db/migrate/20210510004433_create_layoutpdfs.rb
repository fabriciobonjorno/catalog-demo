# frozen_string_literal: true

class CreateLayoutpdfs < ActiveRecord::Migration[6.1]
  def change
    create_table :layoutpdfs do |t|
      t.string :color_header
      t.integer :type_logo
    end
  end
end
