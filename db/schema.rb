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

ActiveRecord::Schema.define(version: 20_200_829_195_932) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.string 'phone'
    t.string 'email'
    t.bigint 'warehouse_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['warehouse_id'], name: 'index_clients_on_warehouse_id'
  end

  create_table 'tireinfos', force: :cascade do |t|
    t.string 'brand'
    t.string 'dimension'
    t.string 'qty'
    t.boolean 'wheels'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'client_id'
    t.index ['client_id'], name: 'index_tireinfos_on_client_id'
  end

  create_table 'vehicleinfos', force: :cascade do |t|
    t.string 'brand'
    t.string 'plate'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'client_id'
    t.index ['client_id'], name: 'index_vehicleinfos_on_client_id'
  end

  create_table 'warehouses', force: :cascade do |t|
    t.string 'location'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'clients', 'warehouses'
  add_foreign_key 'tireinfos', 'clients'
  add_foreign_key 'vehicleinfos', 'clients'
end
