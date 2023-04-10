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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_141622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.string "name"
    t.bigint "idea_id", null: false
    t.string "description"
    t.string "assumption"
    t.integer "validation_technique"
    t.string "metric"
    t.string "success_metric"
    t.string "outcome"
    t.string "conclusion"
    t.string "text_steps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_experiments_on_idea_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_goals_on_project_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "comment"
    t.string "attachment"
    t.integer "status"
    t.string "link"
    t.bigint "opportunity_id"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opportunity_id"], name: "index_ideas_on_opportunity_id"
    t.index ["project_id"], name: "index_ideas_on_project_id"
  end

  create_table "ideas_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "idea_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_ideas_categories_on_category_id"
    t.index ["idea_id"], name: "index_ideas_categories_on_idea_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.integer "source"
    t.string "link"
    t.bigint "outcome_id"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outcome_id"], name: "index_opportunities_on_outcome_id"
    t.index ["project_id"], name: "index_opportunities_on_project_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.string "notes"
    t.string "name"
    t.bigint "goal_id"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_outcomes_on_goal_id"
    t.index ["project_id"], name: "index_outcomes_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_projects_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "avatar_url"
    t.string "provider"
    t.string "uid"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experiments", "ideas"
  add_foreign_key "goals", "projects"
  add_foreign_key "ideas", "opportunities"
  add_foreign_key "ideas", "projects"
  add_foreign_key "ideas_categories", "categories"
  add_foreign_key "ideas_categories", "ideas"
  add_foreign_key "opportunities", "outcomes"
  add_foreign_key "opportunities", "projects"
  add_foreign_key "outcomes", "goals"
  add_foreign_key "outcomes", "projects"
  add_foreign_key "projects", "users", column: "author_id"
end
