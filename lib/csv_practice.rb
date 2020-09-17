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

# ap get_all_olympic_athletes('../data/athlete_events.CSV')

def total_medals_per_team(olympic_data)
  # take in array of data of athletes, each element is a hash...
  # return a hash with the deets of how many metals each team won
  # this hash should have a key for every team winning at least 1 medal (key is string)
  # the value for each key is an integer
  # (team has achieved a medal if not "N/A")
  # method should not be reading from a CSV file - read from arr
  hash_of_teams = {}

  olympic_data.each do |hash|
    hash.map do |key, value|
      if key == "Medal" && value != "NA"
        # puts hash["Team"]
        if hash_of_teams.has_key?("#{hash["Team"]}")
          hash_of_teams["#{hash["Team"]}"] += 1
        else
          hash_of_teams["#{hash["Team"]}"] = 1
        end
      end
    end
  end
  return hash_of_teams
end

def get_all_gold_medalists()
end
