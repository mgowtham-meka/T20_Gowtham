     counting1 = Player.joins("INNER JOIN teams ON teams.id = players.team_id").where("teams.name = ?","team a").select('players.name as name')
     counting2 = Player.where("players.age < ?",25).select('players.name as name')
     counting2 = Player.joins("INNER JOIN teams ON teams.id = players.team_id").select('players.name as name, teams.name')	
     user = Player.create(name: "David", age: 23,position: 'Forward', team_id: 1 )
     user = Player.find_by(name: 'Player 1')   user.update(name: 'Gowtham')  
     user = Player.find_by(name: 'Player 21')   user.destroy



     Team.left_joins(:players).group(:id).having("COUNT(players.id) >?",2)
     Team.left_outer_joins(:players).group(:id).select('teams.*, AVG(players.age) as average_age').order('average_age DESC')


