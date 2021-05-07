class CreateExtraInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :extra_informations do |t|
      t.string :facebook
      t.string :instagram
      t.string :linkedin
      t.string :youtube
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
