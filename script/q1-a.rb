# frozen_string_literal: true

module Cricket
  class Player
    attr_accessor :name, :runs, :wickets

    def initialize(name)
      @name = name
      @runs = 0
      @wickets = 0
    end

    def runs(runs)
      @runs += runs
    end

    def wicket
      @wickets += 1
    end

    def stats
      {
        name: @name,
        runs: @runs,
        wickets: @wickets
      }
    end
  end

  class Team
    attr_accessor :name, :players

    def initialize(name)
      @name = name
      @players = []
    end

    def addingPlayer1(player)
      @players << player
    end

    def teamStatistics
      stats = {}
      @players.each do |player|
        stats[player.name] = player.stats
      end
      stats
    end
  end
end

o = Cricket::Player.new('Gowtham Meka')
o.runs(50)
o.wicket

o1 = Cricket::Team.new('CSK')
o1.addingPlayer1(o)

puts o1.teamStatistics
