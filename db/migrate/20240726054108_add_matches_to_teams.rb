class AddMatchesToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :matches, :home_team, null: false, foreign_key: { to_table: :teams }
    add_reference :matches, :away_team, null: false, foreign_key: { to_table: :teams }
  end
end
