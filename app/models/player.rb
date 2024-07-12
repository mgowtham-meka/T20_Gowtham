class Player < ApplicationRecord
  belongs_to :team

  def self.grouping
     counting1 = Player.joins("INNER JOIN teams ON teams.id = players.team_id").where("teams.name = ?","team a").select('players.name as name')
    
    counting1.each do |i|
      puts "#{i.name}"
    end
  end

  def self.olderage
    counting2 = Player.where("players.age < ?",25).select('players.name as name')
  end

  def self.counting3
    counting2 = Player.joins("INNER JOIN teams ON teams.id = players.team_id").select('players.name as name, teams.name')
    counting2.each do |i|
      puts "name : #{i.name}  team : #{i.team.name}"
    end
  end

  def self.creating
    user = Player.create(name: "David", age: 23,position: 'Forward', team_id: 1 )
    puts user
  end

  def self.updating
    user = Player.find_by(name: 'Player 1')
    user.update(name: 'Gowtham')  
      puts user
  end

  def self.deleting
    
    user = Player.find_by(name: 'Player 21')
    user.destroy
 
   puts user
  end

  

  



end