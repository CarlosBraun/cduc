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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_221622) do
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

  create_table "anuncios", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "categoria"
    t.string "remitente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "allday"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enames", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrenadors", force: :cascade do |t|
    t.string "mail"
    t.string "name"
    t.string "rol"
    t.string "last_name"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluacion_tecs", force: :cascade do |t|
    t.string "title"
    t.date "fecha"
    t.integer "servicio_velocidad"
    t.integer "servicio_precision"
    t.integer "servicio_consistencia"
    t.string "servicio_tipo"
    t.integer "ataque_tiempo"
    t.integer "ataque_precision"
    t.integer "ataque_aproximacion"
    t.integer "ataque_torque"
    t.integer "armado_tiempo"
    t.integer "armado_precision"
    t.integer "armado_footwork"
    t.integer "armado_desiciones"
    t.integer "pase_consistencia"
    t.integer "pase_movbalon"
    t.integer "pase_plataforma"
    t.integer "pase_desiciones"
    t.integer "defensa_lectura"
    t.integer "defensa_bloque"
    t.integer "defensa_campo"
    t.integer "defensa_prosicion"
    t.integer "valores_cooperacion"
    t.integer "valores_responsabilidad"
    t.integer "valores_respeto"
    t.integer "valores_autonomia"
    t.integer "valores_comunicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jugador_id", null: false
    t.index ["jugador_id"], name: "index_evaluacion_tecs_on_jugador_id"
  end

  create_table "evaluacions", force: :cascade do |t|
    t.string "title"
    t.integer "altura"
    t.integer "embergadura"
    t.integer "peso"
    t.integer "max_pres"
    t.integer "max_squat"
    t.integer "max_dl"
    t.integer "max_jump_incompleto"
    t.integer "max_jump_completo"
    t.integer "max_jump_libre"
    t.integer "max_jump_carrera"
    t.integer "max_v1"
    t.integer "max_v2"
    t.time "max_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jugador_id", null: false
    t.integer "ename_id", null: false
    t.index ["ename_id"], name: "index_evaluacions_on_ename_id"
    t.index ["jugador_id"], name: "index_evaluacions_on_jugador_id"
  end

  create_table "horarios", force: :cascade do |t|
    t.string "title"
    t.string "categoria"
    t.string "lugar"
    t.string "dia"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jugadors", force: :cascade do |t|
    t.string "mail"
    t.string "name"
    t.string "name2"
    t.string "last_name1"
    t.string "last_name2"
    t.string "rut"
    t.string "posicion"
    t.string "categoria"
    t.string "genero"
    t.string "fullname"
    t.string "telephone"
    t.boolean "deuda"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noticia", force: :cascade do |t|
    t.string "titulo"
    t.string "texto"
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o2s", force: :cascade do |t|
    t.string "title"
    t.string "categoria"
    t.integer "j1"
    t.integer "j2"
    t.integer "j3"
    t.integer "j4"
    t.integer "j5"
    t.integer "j6"
    t.integer "j7"
    t.integer "j8"
    t.integer "j9"
    t.integer "j10"
    t.integer "j11"
    t.integer "j12"
    t.integer "j13"
    t.integer "j14"
    t.integer "j15"
    t.integer "j16"
    t.integer "j17"
    t.integer "j18"
    t.integer "j19"
    t.integer "j20"
    t.string "torneo"
    t.date "fecha"
    t.integer "e1"
    t.integer "e2"
    t.integer "e3"
    t.integer "es1"
    t.integer "pf1"
    t.integer "med_kine1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "mail"
    t.string "name"
    t.string "last_name"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "evaluacion_tecs", "jugadors"
  add_foreign_key "evaluacions", "enames"
  add_foreign_key "evaluacions", "jugadors"
end
