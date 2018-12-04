class Computer
	attr_accessor :dictionary, :code

	require "csv"


	def initialize
		@dictionary = CSV.open "../dictionary.csv"
		@code = random_word
	end

	def any_letters?(guess)
		puts "ANY_LETTERS?: #{@code.any?(guess)}"
	end

	def random_word
		random_word = []

		@dictionary.each do |word|			
			if(word[0].length >= 5 && word[0].length <= 12)
				random_word.push(word[0].downcase)
			end
		end
		random_word = random_word[rand(random_word.length)]
		[random_word]
	end

	def display
		puts "CODE: #{@code} LENGTH: #{@code.length}"
	end

end