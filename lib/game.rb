class Game
	attr_accessor :board, :player, :computer, :round

	require "./lib/board.rb"
	require "./lib/player.rb"
	require "./lib/computer.rb"
	require "./lib/round.rb"

	def initialize
		@board = Board.new
		puts "What's your name?"
		@player = Player.new(gets.chomp.downcase.capitalize)
		@computer = Computer.new
		@round = Round.new
	end

	def say_hi
		puts "Hello!"
	end

	def computer
		@computer
	end

	def player
		@player
	end
end

new_game = Game.new
new_game.computer.any_letters?(new_game.player.guess)
# new_game.computer.display
# new_game.player.display