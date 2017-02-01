require_relative "./team_data"

class Player
  attr_reader :team_name, :player, :position, :players

  @@instances = []

  def initialize(team_name, player, position)
    @@instances << self

    @team_name = team_name
    @player = player
    @position = position
  end

  def self.all
    return @@instances
  end
end
