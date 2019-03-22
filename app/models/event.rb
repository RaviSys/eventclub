# frozen_string_literal: true

class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :speakers, dependent: :destroy
  accepts_nested_attributes_for :speakers, reject_if: :all_blank,
                                           allow_destroy: true
  has_many :sponsers, dependent: :destroy
  accepts_nested_attributes_for :sponsers, reject_if: :all_blank,
                                           allow_destroy: true
  has_many :event_tickets, dependent: :destroy
  accepts_nested_attributes_for :event_tickets, reject_if: :all_blank,
                                                allow_destroy: true
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  acts_as_taggable_on :tags
  paginates_per 10
  geocoded_by :venue
  after_validation :geocode

  scope :upcoming_events, -> { where('start_date > ?', DateTime.now) }
  scope :past_events, -> { where('end_date < ?', DateTime.now) }
  scope :current_week_events, -> { where('start_date >= ? AND end_date <= ?', current_week_beginning, current_week_ending) }
  scope :next_week_events, -> { where('start_date >= ? AND end_date <= ?', next_week_beginning, next_week_ending) }
  scope :current_month_events, -> { where('start_date >= ? AND end_date <= ?', current_month_beginning, current_month_ending) }
  scope :next_month_events, -> { where('start_date >= ? AND end_date <= ?', next_month_beginning, next_month_ending) }

  def self.current_week_beginning
    DateTime.now.beginning_of_week
  end

  def self.current_week_ending
    DateTime.now.end_of_week
  end

  def self.next_week_beginning
    DateTime.now.end_of_week + 1.day
  end

  def self.next_week_ending
    (DateTime.now.end_of_week + 1.day).end_of_week
  end

  def self.current_month_beginning
    DateTime.now.beginning_of_month
  end

  def self.current_month_ending
    DateTime.now.end_of_month
  end

  def self.next_month_beginning
    DateTime.now.end_of_month + 1.day
  end

  def self.next_month_ending
    (DateTime.now.end_of_month + 1.day).end_of_month
  end

  def short_address
    "#{city}, #{country}"
  end
end
