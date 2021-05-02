# frozen_string_literal: true

class AddNameAndProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :boolean, default: false
  end
end
