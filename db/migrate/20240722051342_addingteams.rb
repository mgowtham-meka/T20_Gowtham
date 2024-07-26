# frozen_string_literal: true

class Addingteams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :founded, :integer
    add_column :teams, :description, :text
  end
end
