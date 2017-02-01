require_relative "./team_data"

class Team
  attr_reader :name, :players

  @@instances = []

  def initialize(name, players)
    @@instances << self
    @name = name
  end

  def self.all
    @@instances
  end

  def players

  end
end
