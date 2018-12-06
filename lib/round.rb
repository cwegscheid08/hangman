class Round
	attr_accessor :player, :computer, :board, :round_number, :game

	def initialize(player, computer, board, game)
		@game = game
		@round_number = 0
		@player = player
		@computer = computer
		@board = board
	end

	def single_round
		guess = player.guess
		if (!board.past_letters.include?(guess) && guess.length <= 1)
			board.guessed_letters(guess)
			@computer.any_letters?(guess) ? board.right_letter(guess) : board.wrong_letter(guess)
			board.display
			@round_number += 1
		elsif guess == "save"
			game.save_game
		elsif guess == "load"
			game.load_game
		elsif guess.length > 1
			puts "\nYOUR GUESS CAN ONLY BE ONE LETTER"
		end
	end

end