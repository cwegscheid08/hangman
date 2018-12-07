class Board
	attr_accessor :body, :board, :round, :player, :computer, :secret, :guessed, :wrong_count


	def initialize(player, computer, body = "", wrong_count = "")
		@player = player
		@computer = computer
		@secret = secret_word
		@guessed = ""
		wrong_count == "" ? @wrong_count = 0 : @wrong_count = wrong_count
		body == "" ? hungman : @body = body
		display
	end

	

	def hungman
		@body = "  __\n |  |\n    |\n    |\n    |\n____|_"
		@body
	end

	def add_limb
		# puts "BODY: #{@body}"
		case @wrong_count
			when 1
				@body = "  __\n |  |\n O  |\n    |\n    |\n____|_"
			when 2
				@body = "  __\n |  |\n O  |\n |  |\n    |\n____|_"
			when 3
				@body = "  __\n |  |\n O  |\n |  |\n/   |\n____|_"
			when 4
				@body = "  __\n |  |\n O  |\n |  |\n/ \\ |\n____|_"
			when 5
				@body = "  __\n |  |\n O  |\n/|  |\n/ \\ |\n____|_"
			when 6
				@body = "  __\n |  |\n O  |\n/|\\ |\n/ \\ |\n____|_"
			else
				puts "ERROR"
		end
		# puts "BODY: #{@body}"
	end

	def right_letter(guess)
		# puts "RIGHT: #{guess}"
		reveal_letters(guess)
	end

	def wrong_letter(guess)
		# puts "WRONG: #{guess}"
		@wrong_count += 1
		add_limb
	end

	def display
		puts "#{@body}\n\n GUESSED: #{past_letters.split("").join("-")}\n GUESS MY WORD: #{secret.split("").join(" ")}"
		# puts "CODE: #{computer.code}"
	end

	def guessed_letters(guess = "")
		# puts "GUESSED LETTERS: #{guessed.include?(guess)}"
		@guessed.include?(guess) ? "" : @guessed += guess
	end

	def reveal_letters(guess)
		@secret.split(" ").join("")
		computer.code.split("").each_with_index do |letter, index|
			guess == letter ? @secret[index] = guess : ""
		end
		@secret.split("").join(" ")
	end

	def past_letters
		@guessed
	end

	def secret_word
		@secret = computer.code.gsub(/\w/, "_")	
	end
end