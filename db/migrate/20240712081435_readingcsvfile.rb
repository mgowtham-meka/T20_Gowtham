class Readingcsvfile < ActiveRecord::Migration[7.1]

  f = File.open("/home/dispatchtrack/Downloads/matches.csv")
  
  def self.import_csv(f)
    CSV.foreach(f.path, headers: true) do |i|
      match = new
      match.date = i["date"]
      match.location = i["location"]
      match.team1_id = i["team1_id"]
      match.team2_id = i["team2_id"]
      match.score_team1 = i["score_team1"]
      match.score_team2 = i["score_team2"]
      match.save!
    end
  end
end
