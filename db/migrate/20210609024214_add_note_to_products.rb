class AddNoteToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :note, :text
  end
end
