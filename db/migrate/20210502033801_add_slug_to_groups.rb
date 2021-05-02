class AddSlugToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :slug, :string, :unique => true
  end
end
