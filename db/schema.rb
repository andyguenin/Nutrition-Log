# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120424025912) do

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "creator_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ingredients", ["creator_id"], :name => "index_ingredients_on_creator_id"

  create_table "log_recipes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "date"
    t.integer  "servings"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "log_recipes", ["recipe_id"], :name => "index_log_recipes_on_recipe_id"
  add_index "log_recipes", ["user_id"], :name => "index_log_recipes_on_user_id"

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ingredient_id"
    t.integer  "servings"
    t.datetime "date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "log_recipe_id"
  end

  add_index "logs", ["ingredient_id"], :name => "index_logs_on_ingredient_id"
  add_index "logs", ["log_recipe_id"], :name => "index_logs_on_log_recipe_id"
  add_index "logs", ["user_id"], :name => "index_logs_on_user_id"

  create_table "nutritions", :force => true do |t|
    t.integer  "ingredient_id"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "label"
    t.float    "quantity"
  end

  add_index "nutritions", ["ingredient_id"], :name => "index_nutritions_on_ingredient_id"

  create_table "recipe_ingredient_joins", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "recipe_ingredient_joins", ["ingredient_id"], :name => "index_recipe_ingredient_joins_on_ingredient_id"
  add_index "recipe_ingredient_joins", ["recipe_id"], :name => "index_recipe_ingredient_joins_on_recipe_id"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.float    "serving_size"
    t.integer  "creator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "recipes", ["creator_id"], :name => "index_recipes_on_creator_id"
  add_index "recipes", ["name"], :name => "index_recipes_on_name"

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_favorite_recipes", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
