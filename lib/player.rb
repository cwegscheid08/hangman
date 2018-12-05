class Player
	attr_accessor :name, :guess, :round, :board

	def initialize(name)
		@name = name
		@guess
	end

	def guess
		puts "Give me a letter."
		@guess = [gets.chomp.downcase]
		# puts "GUESSED IN PLAYER: #{board.past_letters}"
		[@guess].any?(/[a-z]/) ? (puts "Only letters please."; guess()) : ""
		@guess[0]
	end

	def display
		puts "NAME: #{name}  GUESS: #{@guess}"
	end

end