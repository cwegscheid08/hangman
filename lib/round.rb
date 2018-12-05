class Round
	attr_accessor :player, :computer, :board, :round_number

	def initialize(player, computer, board)
		# play
		@round_number = 0
		@player = player
		@computer = computer
		@board = board
	end

	def single_round
		guess = player.guess
		board.guessed_letters(guess)
		@computer.any_letters?(guess) ? board.right_letter(guess) : board.wrong_letter(guess)
		board.display
		@round_number += 1
	end

end