def game_hash 
  
  table = {
  home: {team_name: 'Brooklyn Nets', colors: ["Black", "White"], players: [
    {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
    {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    ]}, 
  away: {team_name: 'Charlotte Hornets', colors: ["Turquoise", "Purple"], players: [
    {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
    {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
    {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
    {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
    {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12},
  ]}
}
end

def num_points_scored(name)
 game_hash.each_value do |value| 
  value[:players].map do |player|
    if player[:player_name] == name
      return player[:points]
    end
  end
 end
end


def shoe_size(name) 
  game_hash.each_value do |v|
    v[:players].map do |player|
      if player[:player_name] == name
        return player[:shoe]
    end
  end
  end
end

def team_colors(name)
  game_hash.each_value do |v|
    if v[:team_name] == name
     return v[:colors]
    end
  end
end

def team_names
  arr = []
  game_hash.each_value {|v| arr.push(v[:team_name])}
  return arr
end

def player_numbers(team)
  arr = []
  game_hash.each_value do |v|
    if v[:team_name] == team
      v[:players].map {|player| arr.push(player[:number])}
    end
  end
return arr
end

def player_stats(name)
  game_hash.each_value do |v|
    v[:players].map do |player|
      if player[:player_name] == name
        temp = player.dup
        temp.delete(:player_name)
        return temp
      end
    end
  end
end

def big_shoe_rebounds
  max_shoe = 0
  rebounds = 0
  game_hash.each_value do |v|
    v[:players].map do |player|
      if player[:shoe] > max_shoe 
        max_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
   end
  rebounds
end

def most_points_scored
  max_points = 0
  max_player = ''
  game_hash.each_value do |v|
    v[:players].map do |player| 
      if player[:points] > max_points
        max_points = player[:points]
        max_player = player[:player_name]
      end
    end
  end
  max_player
end

def winning_team
  max_points = 0
  team = ""
  game_hash.each_value do |v|
    total = v[:players].reduce(0) {|acc, player| acc = acc + player[:points]}
    if total > max_points
      max_points = total
      team = v[:team_name]
    end
  end
  team
end

def player_with_longest_name
  max_charaters = 0
  max_name = ''  
  game_hash.each_value do |v|
    v[:players].map do |player|
      if player[:player_name].length > max_charaters
        max_charaters = player[:player_name].length
        max_name = player[:player_name]
      end
    end
  end
  max_name
end

def long_name_steals_a_ton?
  max_steals = 0
  max_player = ''
  game_hash.each_value do |v|
    v[:players].map do |player| 
      if player[:steals] > max_steals
        max_steals = player[:steals]
        max_player = player[:player_name]
      end
    end
  end
  max_player == player_with_longest_name
end


