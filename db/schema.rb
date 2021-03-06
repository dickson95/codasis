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

ActiveRecord::Schema.define(version: 20170307234555) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rol_id"], name: "index_assignments_on_rol_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
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

  create_table "eventos_personas", force: :cascade do |t|
    t.integer  "evento_id"
    t.integer  "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_eventos_personas_on_evento_id"
    t.index ["persona_id"], name: "index_eventos_personas_on_persona_id"
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
    t.integer  "evento_id"
    t.index ["cargo_id"], name: "index_personas_on_cargo_id"
    t.index ["evento_id"], name: "index_personas_on_evento_id"
    t.index ["usuario_id"], name: "index_personas_on_usuario_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
