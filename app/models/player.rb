class Player < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :position, presence: true
  validates :team, presence: true
  validates :role, presence: true
  enum role: [:allrounder, :bowler, :batsman]

  

end