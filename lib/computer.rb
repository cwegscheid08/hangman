class Computer
	attr_accessor :player, :board, :code, :dictionary

	require "csv"


	def initialize(code = "")
		@player
		@board
		@dictionary = CSV.open "dictionary.csv"
		code == "" ? @code = random_word : @code = code
	end

	def any_letters?(guess)
		@code.include?(guess) ? true : false
	end

	private

	def random_word
		random_word = []
		@dictionary.each do |word|			
			if(word[0].length >= 5 && word[0].length <= 12)
				random_word.push(word[0].downcase)
			end
		end
		random_word = random_word[rand(random_word.length)]
		random_word
	end

	def display
		puts "CODE: #{@code} LENGTH: #{@code.length}"
	end

end