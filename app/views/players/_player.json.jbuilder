json.extract! player, :id, :name, :number, :points, :rebounds, :assists, :blocks, :steals, :fouls
json.url player_url(player, format: :json)