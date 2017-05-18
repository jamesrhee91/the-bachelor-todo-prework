def get_first_name_of_season_winner(data, season)
  data[season].find do |con|
    con.fetch("status") == "Winner"
  end.fetch("name").split.first
end

def get_contestant_name(data, occupation)
  contestants(data).find do |con|
    con.fetch("occupation") == occupation
  end.fetch("name")
end

def count_contestants_by_hometown(data, hometown)
  contestants(data).count do |con|
    con.fetch("hometown") == hometown
  end
end

def get_occupation(data, hometown)
  contestants(data).find do |con|
    con.fetch("hometown") == hometown
  end.fetch("occupation")
end

def get_average_age_for_season(data, season)
  ages = data[season].map {|con| con["age"].to_i}
  avg = ages.reduce(:+) / ages.length.to_f
  avg.round
end

def contestants(hash)
  hash.map do |season, array|
    array
  end.flatten
end
