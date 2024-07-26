class AddHomeAndAwayTeamIdsToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :home_team_id, :integer, null: false
    add_column :matches, :away_team_id, :integer, null: false
  end
end


