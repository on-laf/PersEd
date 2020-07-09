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

ActiveRecord::Schema.define(version: 2020_07_09_204705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "flashcard_homeworks", force: :cascade do |t|
    t.string "name"
    t.datetime "due_date"
    t.bigint "group_id", null: false
    t.bigint "flashcard_set_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "sent", default: false
    t.boolean "draft", default: true
    t.index ["flashcard_set_id"], name: "index_flashcard_homeworks_on_flashcard_set_id"
    t.index ["group_id"], name: "index_flashcard_homeworks_on_group_id"
  end

  create_table "flashcard_sets", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_flashcard_sets_on_teacher_id"
  end

  create_table "flashcard_templates", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.bigint "teacher_id", null: false
    t.bigint "flashcard_set_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flashcard_set_id"], name: "index_flashcard_templates_on_flashcard_set_id"
    t.index ["teacher_id"], name: "index_flashcard_templates_on_teacher_id"
    t.index ["topic_id"], name: "index_flashcard_templates_on_topic_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "class_name"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "object_id"
    t.string "object_type"
  end

  create_table "student_flashcard_sets", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "flashcard_homework_id", null: false
    t.boolean "submitted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flashcard_homework_id"], name: "index_student_flashcard_sets_on_flashcard_homework_id"
    t.index ["student_id"], name: "index_student_flashcard_sets_on_student_id"
  end

  create_table "student_flashcards", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.text "student_answer"
    t.text "feedback"
    t.boolean "completed", default: false
    t.bigint "student_flashcard_set_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "flashcard_template_id"
    t.index ["flashcard_template_id"], name: "index_student_flashcards_on_flashcard_template_id"
    t.index ["student_flashcard_set_id"], name: "index_student_flashcards_on_student_flashcard_set_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "students_groups", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_students_groups_on_group_id"
    t.index ["student_id"], name: "index_students_groups_on_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic_name"
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_topics_on_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "flashcard_homeworks", "flashcard_sets"
  add_foreign_key "flashcard_homeworks", "groups"
  add_foreign_key "flashcard_sets", "teachers"
  add_foreign_key "flashcard_templates", "flashcard_sets"
  add_foreign_key "flashcard_templates", "teachers"
  add_foreign_key "flashcard_templates", "topics"
  add_foreign_key "groups", "teachers"
  add_foreign_key "student_flashcard_sets", "flashcard_homeworks"
  add_foreign_key "student_flashcard_sets", "students"
  add_foreign_key "student_flashcards", "flashcard_templates"
  add_foreign_key "student_flashcards", "student_flashcard_sets"
  add_foreign_key "students_groups", "groups"
  add_foreign_key "students_groups", "students"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
  add_foreign_key "teachers", "users"
  add_foreign_key "topics", "subjects"
end
