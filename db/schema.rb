# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_28_021021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "description"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_families_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "ean"
    t.string "dun"
    t.string "display"
    t.string "description"
    t.bigint "family_id", null: false
    t.bigint "tax_classification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_products_on_family_id"
    t.index ["tax_classification_id"], name: "index_products_on_tax_classification_id"
  end

  create_table "similar_products", force: :cascade do |t|
    t.string "code"
    t.string "ean"
    t.string "dun"
    t.string "display"
    t.string "description"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_similar_products_on_product_id"
  end

  create_table "tax_classifications", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "families", "groups"
  add_foreign_key "products", "families"
  add_foreign_key "products", "tax_classifications"
  add_foreign_key "similar_products", "products"
end
