class Player
	attr_accessor :name, :guess

	def initialize(name)
		@name = name
		@guess
	end

	def guess
		puts "Give me a letter."
		@guess = [gets.chomp.downcase]
		@guess.any?(/[a-z]/) ? "" : (puts "Only letters please."; guess())
		@guess[0]
	end

	# def letter
		# @guess
	# end


	def display
		puts "NAME: #{name}  GUESS: #{@guess}"
	end

end