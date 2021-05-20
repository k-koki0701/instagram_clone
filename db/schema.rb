ActiveRecord::Schema.define(version: 2021_05_20_051601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "content"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
