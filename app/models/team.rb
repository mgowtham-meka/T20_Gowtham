# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'

  accepts_nested_attributes_for :players, allow_destroy: true

  validates :name, presence: true
  validates :country, presence: true
  validates :founded, presence: true, numericality: { greater_than: 1901 }
  validates :description, presence: true
  validates :player_count, presence: true, numericality: { greater_than_or_equal_to: 0 }


  default_scope { where(active: true) }

  scope :by_role, ->(role) { where(role: role) }
end
