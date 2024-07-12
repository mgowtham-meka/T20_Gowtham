class Team < ApplicationRecord
    has_many :players

    def self.filtering
        Team.left_joins(:players).group(:id).having("COUNT(players.id) >?",2)
        
      end


      def self.ans
        Team.left_outer_joins(:players).group(:id).select('teams.*, AVG(players.age) as average_age').order('average_age DESC')
      end



end
