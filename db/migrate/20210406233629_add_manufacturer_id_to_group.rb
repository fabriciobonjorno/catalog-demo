# frozen_string_literal: true

class AddManufacturerIdToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :manufacturer, null: false, foreign_key: true
  end
end
