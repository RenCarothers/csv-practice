require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  # take in a file name (a string with a path)
  # return an array of Olympic medalists,
  # each person a hash element within the array,
  # listing only these keys: id, name, height, team, year, city, sport, event, medal
  # a test could be: does it output an array? ea index hashes?
  array_of_hashes = CSV.read(filename, headers: true).map do |row|
    row.to_h
  end

  #Sex,Age,Weight,NOC,Year,Season,
  array_of_hashes.each do |hash|
    hash.delete("Sex") if hash.include?("Sex")
    hash.delete("Age") if hash.include?("Age")
    hash.delete("Weight") if hash.include?("Weight")
    hash.delete("NOC") if hash.include?("NOC")
    hash.delete("Games") if hash.include?("Games")
    hash.delete("Season") if hash.include?("Season")

  end
  return array_of_hashes
end

ap get_all_olympic_athletes('../data/athlete_events.CSV')

def total_medals_per_team(olympic_data)

end

def get_all_gold_medalists(olympic_data)
end
