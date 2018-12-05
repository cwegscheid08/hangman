class Board
	attr_accessor :row, :board, :round, :player, :computer, :secret, :guessed


	def initialize(player, computer)
		@player = player
		@computer = computer
		@secret = secret_word
		@guessed = ""
		display
	end

	


	def right_letter(guess)
		puts "RIGHT: #{guess}"
		reveal_letters(guess)
	end

	def wrong_letter(guess)
		puts "WRONG: #{guess}"
	end

	def display
		puts "GUESS THIS: #{secret.split("").join(" ")}\n CODE: #{computer.code}\n GUESSED: #{guessed_letters.split("").join("-")}"
	end

	def guessed_letters(guess = "")
		@guessed += guess
	end

	def reveal_letters(guess)
		@secret.split(" ").join("")
		computer.code.split("").each_with_index do |letter, index|
			guess == letter ? @secret[index] = guess : ""
		end
		@secret.split("").join(" ")
	end


	def secret_word
		@secret = computer.code.gsub(/\w/, "_")	
	end
end