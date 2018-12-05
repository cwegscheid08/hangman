class Player
	attr_accessor :name, :guess, :round

	def initialize(name)
		@name = name
		@guess
	end

	def guess
		puts "Give me a letter."
		@guess = [gets.chomp.downcase]
		# puts "GUESS:#{@guess}"
		[@guess].any?(/[a-z]/) ? (puts "Only letters please."; guess()) : ""
		# puts "GUESS#{@guess[0]}"
		@guess[0]
	end

	def display
		puts "NAME: #{name}  GUESS: #{@guess}"
	end

end