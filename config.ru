require 'sinatra'
# require 'sinatra/reloader'
require './lib/game.rb'

message = "Hello World!"
game = Game.new
board = game.board.display

post '/' do

	erb :index, :locals => {
		:board => board
	}
end

get '/' do 
	
	erb :index, :locals => {
		:message => message
	}
end