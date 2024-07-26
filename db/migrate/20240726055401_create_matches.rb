class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :location
      t.date :date
      

      t.timestamps
    end
  end
end


# class AddHomeAndAwayTeamIdsToMatches < ActiveRecord::Migration[7.1]
#   def change
#     add_column :matches, :home_team_id, :integer, null: false
#     add_column :matches, :away_team_id, :integer, null: false

#     add_foreign_key :matches, :teams, column: :home_team_id
#     add_foreign_key :matches, :teams, column: :away_team_id
#   end
# end