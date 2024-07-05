require 'csv'    

require 'csv'




CSV.foreach('/home/dispatchtrack/T20_world_cup/script/sample_cricket_stats.csv', headers: true) do |row|
    def sr

    end

    
  puts row['column1'] 
  puts "#{row[0]} strike rate  #{row[1]}  balls faced   #{row[4]}  most sixes #{row[4]}"

end