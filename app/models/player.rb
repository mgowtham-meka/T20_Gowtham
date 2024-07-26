# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :matches
  enum role: { allrounder: 'allrounder', bowler: 'bowler', batsman: 'batsman' }

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :position, presence: true
  validates :team, presence: true
  validates :is_captain, inclusion: { in: [true, false] }
  validates :is_active, inclusion: { in: [true, false] }
  


  before_destroy :dont_delete_captain

  
  after_create :update_team_player_count
  after_destroy :update_team_player_count

  
  before_create :checking_one_captain_per_team

  private

  def dont_delete_captain
    if is_captain?
      errors[:base] = " deleting  captain is not possible"
      throw(:abort)
    end
  end

  def update_team_player_count
    team.update(player_count: team.players.count)
  end

  def checking_one_captain_per_team
    if team.players.where(is_captain: true).exists?
      errors[:base] = "Team contains captain"
      throw(:abort)
    end
  end

   
   default_scope { where(is_active: true) }

  
   scope :by_role, ->(role) { where(role: role) }
end


