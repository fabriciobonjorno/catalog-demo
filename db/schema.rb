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

ActiveRecord::Schema.define(version: 2021_06_09_024214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "social_name"
    t.string "fantasy_name"
    t.string "cnpj"
    t.string "ie"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "cell_phone"
    t.string "email"
    t.string "site"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone"
    t.string "message"
    t.boolean "commercial", default: false
    t.boolean "financial", default: false
    t.boolean "logistic", default: false
    t.boolean "administrative", default: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "extra_informations", force: :cascade do |t|
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.string "youtube"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_extra_informations_on_company_id"
  end

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
    t.bigint "manufacturer_id", null: false
    t.string "slug"
    t.index ["manufacturer_id"], name: "index_groups_on_manufacturer_id"
  end

  create_table "layoutpdfs", force: :cascade do |t|
    t.string "color_header"
    t.string "type_logo"
  end

  create_table "manufacturers", force: :cascade do |t|
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
    t.boolean "detach", default: false
    t.boolean "active", default: true
    t.string "slug"
    t.string "quantitie"
    t.text "note"
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

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
  end

  create_table "tax_classifications", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "profile", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contacts", "companies"
  add_foreign_key "extra_informations", "companies"
  add_foreign_key "families", "groups"
  add_foreign_key "groups", "manufacturers"
  add_foreign_key "products", "families"
  add_foreign_key "products", "tax_classifications"
  add_foreign_key "similar_products", "products"
end
