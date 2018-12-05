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
		# puts "PAST: #{board.past_letters.include?(guess)}"
		if (!board.past_letters.include?(guess))
			board.guessed_letters(guess)
			@computer.any_letters?(guess) ? board.right_letter(guess) : board.wrong_letter(guess)
			board.display
			@round_number += 1
			game.is_over?
		end
	end

end