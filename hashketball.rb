require 'pp'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: [
        { player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        { player_name: "Reggie Evans",  number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},        
        { player_name: "Brook Lopez",   number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        { player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        { player_name: "Jason Terry",   number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: [
        { player_name: "Jeff Adrien",     number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        { player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        { player_name: "DeSagna Diop",    number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        { player_name: "Ben Gordon",      number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        { player_name: "Kemba Walker",    number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(players_name)
  game_hash.each_value { |v| 
    v[:players].each { |player|
      return player[:points] if player.has_value?(players_name)
    }
  }
end

def shoe_size(players_name)
    game_hash.each_value { |v| 
    v[:players].each { |player|
      return player[:shoe] if player.has_value?(players_name)
    }
  }
end

def team_colors(teams_name)
  game_hash.each_pair { |k, v| 
  return v[:colors] if v[:team_name] == (teams_name)
  }
end

def team_names
  arr = []
  game_hash.each_pair { |k, v| arr.push(v[:team_name]) }
  return arr
end

def player_numbers(teams_name)
  game_hash.each_pair { |k, v|
    return v[:players].map { |player| player[:number] } if v[:team_name] == teams_name
  }
end

def player_stats(players_name)
  game_hash.each_value { |v| 
    v[:players].each { |player|
    if player.has_value?(players_name)
      player.delete(:player_name)
      return player
    end
    }
  }
end

def big_shoe_rebounds
  max_shoe = 0
  rebounds = 0
  game_hash.each_value { |v| 
    v[:players].each { |player|
      if player[:shoe] > max_shoe
        max_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    }
  }
  return rebounds
end

# def most_points_scored
#   max_score = 0
#   name = ''
#   game_hash.each_value { |v| 
#     v[:players].each { |player|
#       if player[:points] > max_score
#         max_score = player[:points]
#         name = player[:player_name]
#       end
#     }
#   }
#   return name
# end

def most_points_scored
  arr = []
  game_hash.each_value { |team| arr.push(team[:players])}
  arr.flatten.max { |a, b| a[:points] <=> b[:points]}[:player_name]
end

def winning_team
  max_points = 0
  leading_team = ''
  game_hash.each_value { |team| 
    total_points = team[:players].map { | player | 
      player[:points]}.reduce(:+)
      if total_points > max_points
        max_points = total_points
        leading_team  = team[:team_name]
      end
  }
  return leading_team
end

def player_with_longest_name
  longest_name = 0
  name = ''
  game_hash.each_value { |v| 
    v[:players].each { |player|
      if player[:player_name].length > longest_name
        longest_name = player[:player_name].length
        name = player[:player_name]
      end
    }
  }
  return name
end

def long_name_steals_a_ton?
  arr = []
  game_hash.each_value { |team| arr.push(team[:players])}
  arr.flatten.max { |a, b| a[:steals] <=> b[:steals]}[:player_name]
end

