def game_hash
	games = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black","White"],
			:players => [
								{:player_name => "Alan Anderson",
								:number => 0,
								:shoe => 16,
								:points => 22, 
								:rebounds => 12, 
								:assists => 12, 
								:steals => 3, 
								:blocks => 1, 
								:slam_dunks => 1 },

 								{:player_name => "Reggie Evans",
								:number => 30,
								:shoe => 14,
								:points => 12, 
								:rebounds => 12, 
								:assists => 12, 
								:steals => 12, 
								:blocks => 12, 
								:slam_dunks => 7},

 								{:player_name => "Brook Lopez",
								:number => 11,
								:shoe => 17,
								:points => 17, 
								:rebounds => 19, 
								:assists => 10, 
								:steals => 3, 
								:blocks => 1, 
								:slam_dunks => 15},

 								{:player_name => "Mason Plumlee",
								:number => 1,
								:shoe => 19,
								:points => 26, 
								:rebounds => 12, 
								:assists => 6, 
								:steals => 3, 
								:blocks => 8, 
								:slam_dunks => 5},

 								{:player_name => "Jason Terry",
								:number => 31,
								:shoe => 15,
								:points => 19, 
								:rebounds => 2, 
								:assists => 2, 
								:steals => 4, 
								:blocks => 11, 
								:slam_dunks => 1}]
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise","Purple"],
			:players => [
								{:player_name => "Jeff Adrien",
								:number => 4,
								:shoe => 18,
								:points => 10, 
								:rebounds => 1, 
								:assists => 1, 
								:steals => 2, 
								:blocks => 7, 
								:slam_dunks => 2},

 								{:player_name => "Bismak Biyombo",
								:number => 0,
								:shoe => 16,
								:points => 12, 
								:rebounds => 4, 
								:assists => 7, 
								:steals => 7, 
								:blocks => 15, 
								:slam_dunks => 10},

 								{:player_name => "DeSagna Diop",
								:number => 2,
								:shoe => 14,
								:points => 24, 
								:rebounds => 12, 
								:assists => 12, 
								:steals => 4, 
								:blocks => 5, 
								:slam_dunks => 5},

 								{:player_name => "Ben Gordon",
								:number => 8,
								:shoe => 15,
								:points => 33, 
								:rebounds => 3, 
								:assists => 2, 
								:steals => 1, 
								:blocks => 1, 
								:slam_dunks => 0 },

 								{:player_name => "Brendan Haywood",
								:number => 33,
								:shoe => 15,
								:points => 6, 
								:rebounds => 12, 
								:assists => 12, 
								:steals => 22, 
								:blocks => 5, 
								:slam_dunks => 12}]
		}

 	}	
	return games
end

 def points_raw(array, name)
	array.each do |player|
	return player[:points] if player[:player_name] == name
	end
	return false
end

 def num_points_scored(name)
	 return points_raw(game_hash[:home][:players],name) if points_raw(game_hash[:home][:players],name)
	 return points_raw(game_hash[:away][:players],name) if points_raw(game_hash[:away][:players],name)
end


 def shoe_size_raw(array, name)
	array.each do |player|
	return player[:shoe] if player[:player_name] == name
	end
	return false
end

 def shoe_size(name)
	 return shoe_size_raw(game_hash[:home][:players],name) if shoe_size_raw(game_hash[:home][:players],name)
	 return shoe_size_raw(game_hash[:away][:players],name) if shoe_size_raw(game_hash[:away][:players],name)
end


 def team_colors(team_name)
	game_hash.each { |location, team_data| return team_data[:colors] if team_data[:team_name] == team_name }
end

 def team_names()
	output = []
	game_hash.each { |location, team_data| output.push(team_data[:team_name]) }
	return output
end


 def player_numbers(team_name)
	jerseys = []
	game_hash.each do |location, team_data| 
		if team_data[:team_name] == team_name
			team_data[:players].each {|a| jerseys.push(a[:number]) }
		end
	end
	return jerseys
end


 def player_stats(player_name)
	game_hash.each do |location, team_data|
		team_data[:players].each do |a| 
			if a[:player_name] == player_name
				my_hash = a
				my_hash.shift
				return my_hash
			end
		end
	end
end


 def big_shoe_rebounds
	#find largest shoe size
	max_size = 0
	game_hash.each do |location, team_data|
		team_data[:players].each {|a| max_size = a[:shoe] if a[:shoe] > max_size }
	end

 	#get that from the array
	rebounds = nil
	game_hash.each do |location, team_data|
		team_data[:players].each {|a| rebounds = a[:rebounds] if a[:shoe] == max_size }
	end
	return rebounds
end


 #puts player_stats("Bismak Biyombo")
#puts team_colors("Brooklyn Nets")
#puts team_names()



 puts big_shoe_rebounds
