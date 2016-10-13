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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161013171623) do

  create_table "asistencias", force: :cascade do |t|
    t.date     "fecha"
    t.string   "ciudad"
    t.string   "objetivo"
    t.integer  "persona_id"
    t.integer  "evento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_asistencias_on_evento_id"
    t.index ["persona_id"], name: "index_asistencias_on_persona_id"
  end

  create_table "assignmentes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignmentes_on_role_id"
    t.index ["user_id"], name: "index_assignmentes_on_user_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "dependencia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "asunto"
    t.date     "fecha"
    t.time     "hora"
    t.string   "ubicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombres"
    t.string   "documento"
    t.string   "empresa"
    t.string   "email"
    t.string   "telefono"
    t.string   "codigo"
    t.integer  "cargo_id"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_personas_on_cargo_id"
    t.index ["usuario_id"], name: "index_personas_on_usuario_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unites", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "usuario"
    t.string   "contraseña"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valuationes", force: :cascade do |t|
    t.integer  "good_min"
    t.integer  "good_max"
    t.integer  "level1"
    t.string   "image1"
    t.integer  "vuln_min"
    t.integer  "vuln_max"
    t.integer  "level2"
    t.string   "image2"
    t.integer  "low_min"
    t.integer  "low_max"
    t.integer  "level3"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
