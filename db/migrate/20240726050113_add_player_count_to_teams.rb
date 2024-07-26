class AddPlayerCountToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :player_count, :integer, default: 0

    add_index :teams, :name, unique: true
  end
end
