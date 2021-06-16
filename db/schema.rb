ActiveRecord::Schema.define(version: 2021_06_16_130716) do

  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "title"
  end

  create_table "todos", force: :cascade do |t|
    t.text "text"
    t.boolean "isCompleted"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_todos_on_project_id"
  end

end
