require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "views")

teams = TeamData.teams
team_roster = []

teams.each do |team, roster|

  players = []

  roster.each do |position, player|
    players.push(Player.new(team, player, position))
  end

  team = Team.new(team, players)
  team_roster.push(team)
end


get "/" do
  "<h1>Our Kickball Site<h1>"
end

get '/teams' do
  @teams = Team.all

  erb :'teams/index'
end

get '/teams/:name' do
  @team = Team.all
 @team_name = params[:name]
 # @roster = @teams[@team_name.to_sym]
 # @teams = TeamData::ROLL_CALL

 erb :'teams/show'
end

get '/positions' do
  @positions = TeamData::POSITIONS

  erb :'positions/index'
end

get '/positions/:position' do
  @position = params[:position]
  @teams = TeamData::ROLL_CALL

  @players = players

  erb :'positions/show'
end
