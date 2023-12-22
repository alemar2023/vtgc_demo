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

ActiveRecord::Schema[7.1].define(version: 2023_11_28_135835) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_areas_on_name", unique: true
  end

  create_table "brand_i18ns", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name", null: false
    t.string "locale", default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_brand_i18ns_on_brand_id"
    t.index ["locale", "brand_id"], name: "index_brand_i18ns_on_locale_and_brand_id", unique: true
    t.index ["locale"], name: "index_brand_i18ns_on_locale"
    t.index ["name"], name: "index_brand_i18ns_on_name"
  end

  create_table "brands", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_brands_on_area_id"
    t.index ["name", "area_id"], name: "index_brands_on_name_and_area_id", unique: true
    t.index ["name"], name: "index_brands_on_name"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.string "name"
  end

  create_table "category_i18ns", force: :cascade do |t|
    t.string "name"
    t.string "locale"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_i18ns_on_category_id"
    t.index ["locale", "category_id"], name: "index_category_i18ns_on_locale_and_category_id", unique: true
    t.index ["locale"], name: "index_category_i18ns_on_locale"
    t.index ["name"], name: "index_category_i18ns_on_name"
  end

  create_table "coll_i18ns", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.string "name", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_coll_i18ns_on_collection_id"
    t.index ["locale", "collection_id"], name: "index_coll_i18ns_on_locale_and_collection_id", unique: true
    t.index ["locale"], name: "index_coll_i18ns_on_locale"
    t.index ["name"], name: "index_coll_i18ns_on_name"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_collections_on_brand_id"
    t.index ["name", "brand_id"], name: "index_collections_on_name_and_brand_id", unique: true
    t.index ["name"], name: "index_collections_on_name"
  end

  create_table "item_i18ns", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "name", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_i18ns_on_item_id"
    t.index ["locale", "item_id"], name: "index_item_i18ns_on_locale_and_item_id", unique: true
    t.index ["locale"], name: "index_item_i18ns_on_locale"
    t.index ["name"], name: "index_item_i18ns_on_name"
  end

  create_table "item_values", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "item_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_values_on_item_id"
    t.index ["property_id"], name: "index_item_values_on_property_id"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id"
    t.bigint "collection_id"
    t.bigint "area_id", null: false
    t.index ["area_id"], name: "index_items_on_area_id", unique: true
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["collection_id"], name: "index_items_on_collection_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.bigint "area_id"
    t.index ["name"], name: "index_properties_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "user", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "brands", "areas"
  add_foreign_key "category_i18ns", "categories"
  add_foreign_key "coll_i18ns", "collections"
  add_foreign_key "collections", "brands"
  add_foreign_key "item_i18ns", "items"
  add_foreign_key "item_values", "items"
  add_foreign_key "item_values", "properties"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "collections"
end
