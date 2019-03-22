# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_307_054_739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'event_tickets', force: :cascade do |t|
    t.integer 'price'
    t.integer 'total_tickets'
    t.integer 'available_tickets'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'ticket_for'
    t.index ['event_id'], name: 'index_event_tickets_on_event_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.string 'cover_image'
    t.string 'venue'
    t.string 'city'
    t.string 'state'
    t.string 'country'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.integer 'favourites_count'
    t.index ['slug'], name: 'index_events_on_slug', unique: true
  end

  create_table 'favourites', force: :cascade do |t|
    t.bigint 'event_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_favourites_on_event_id'
    t.index ['user_id'], name: 'index_favourites_on_user_id'
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.integer 'amount'
    t.integer 'quantity'
    t.bigint 'user_id'
    t.bigint 'event_ticket_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_ticket_id'], name: 'index_order_items_on_event_ticket_id'
    t.index ['user_id'], name: 'index_order_items_on_user_id'
  end

  create_table 'speakers', force: :cascade do |t|
    t.string 'name'
    t.string 'organization'
    t.string 'city'
    t.string 'country'
    t.string 'profile_image'
    t.text 'about'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_speakers_on_event_id'
  end

  create_table 'sponsers', force: :cascade do |t|
    t.string 'sponsered_by'
    t.string 'logo_image'
    t.integer 'amount'
    t.string 'website'
    t.string 'contact'
    t.text 'about'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_sponsers_on_event_id'
  end

  create_table 'taggings', id: :serial, force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'index_taggings_on_taggable_id_and_taggable_type_and_context'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
  end

  create_table 'tags', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.string 'contact'
    t.string 'stripe_customer_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'event_tickets', 'events'
  add_foreign_key 'favourites', 'events'
  add_foreign_key 'favourites', 'users'
  add_foreign_key 'order_items', 'event_tickets'
  add_foreign_key 'speakers', 'events'
  add_foreign_key 'sponsers', 'events'
end
