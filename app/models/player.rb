class Player < ApplicationRecord
  belongs_to :team
  enum role: { allrounder: 'allrounder', bowler: 'bowler', batsman: 'batsman' }

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :position, presence: true
  validates :team, presence: true
  validates :is_captain, inclusion: { in: [true, false] }
  validates :is_active, inclusion: { in: [true, false] }

  

end