class AddDetailsToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :is_captain, :boolean, null: false, default: false
    add_column :players, :is_active, :boolean, null: false, default: true
    add_column :players, :description, :text
    add_column :players, :role, :string, null: false

  end
end
