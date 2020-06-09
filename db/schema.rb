# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_09_194832) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "position"
    t.string "title"
    t.integer "book_id", null: false
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "height"
    t.string "race"
    t.string "gender"
    t.string "birth"
    t.string "spouse"
    t.string "death"
    t.string "realm"
    t.string "hair"
    t.string "name"
    t.string "wikiUrl"
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "runtimeInMinutes"
    t.integer "budgetInMillions"
    t.integer "boxOfficeRevenueInMillions"
    t.integer "academyAwardNominations"
    t.integer "academyAwardWins"
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer "chapter_id", null: false
    t.integer "character_id", null: false
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_participations_on_chapter_id"
    t.index ["character_id"], name: "index_participations_on_character_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "dialog"
    t.integer "movie_id", null: false
    t.integer "character_id", null: false
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_quotes_on_character_id"
    t.index ["movie_id"], name: "index_quotes_on_movie_id"
  end

  add_foreign_key "chapters", "books"
  add_foreign_key "participations", "chapters"
  add_foreign_key "participations", "characters"
  add_foreign_key "quotes", "characters"
  add_foreign_key "quotes", "movies"
end
