class Match < ApplicationRecord
  belongs_to :home_team
  belongs_to :away_team



  before_save :date_wontbe_past
  

  private

  def date_wontbe_past
    if date && date < Date.today
      errors[:date] = "Cannot be in the past"
      throw(:abort)
    end
  end

 


  scope :upcoming, -> { where("date >= ?", Date.today) }
  scope :for_team, ->(team_id) { where("home_team_id = ? OR away_team_id = ?", team_id, team_id) }
  
end


