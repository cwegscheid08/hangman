class Game
	attr_accessor :board, :player, :computer, :round

	require "./lib/board.rb"
	require "./lib/player.rb"
	require "./lib/computer.rb"
	require "./lib/round.rb"

	def initialize
		puts "What's your name?"
		@player = Player.new(gets.chomp.downcase.capitalize)
		@computer = Computer.new
		@board = Board.new(@player, @computer)
		@round = Round.new(@player, @computer, @board)
		start_game
	end

	def start_game
		while round.round_number <= 5
			round.single_round
		end
	end

	def say_hi
		puts "Hello!"
	end
end

new_game = Game.new
# new_game.computer.any_letters?(new_game.player.guess)
# new_game.computer.display
# new_game.player.display