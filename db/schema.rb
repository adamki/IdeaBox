ActiveRecord::Schema.define(version: 20150917210319) do

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
