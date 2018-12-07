class Player
	attr_accessor :name, :guess, :board

	def initialize(name)
		@name = name
		@guess
	end

	def guess
		puts "Give me a letter."
		@guess = [gets.chomp.downcase]
		[@guess].any?(/[a-z]/) ? (puts "Only letters please."; guess()) : ""
		@guess[0]
	end
end