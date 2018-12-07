class Round
	attr_accessor :player, :computer, :board, :round_number, :game

	def initialize(player, computer, board, game, round = 0)
		@game = game
		@round_number = round.to_i
		@player = player
		@computer = computer
		@board = board
	end

	def single_round
		guess = player.guess
		if (!board.past_letters.include?(guess) && guess.length <= 1)
			board.guessed_letters(guess)
			@computer.any_letters?(guess) ? board.right_letter(guess) : board.wrong_letter(guess)
			board.display
			@round_number += 1
		elsif guess == "save"
			game.save_game
		elsif guess == "load"
			game.load_game
		elsif guess.length > 1
			puts "\nYOUR GUESS CAN ONLY BE ONE LETTER"
		end
	end

	# def save_game
	# 	# Dir.mkdir("file_save") unless Dir.exist? "file_name"

	# 	filename = "file_save/#{player.name.downcase}_#{Time.new.usec}.yaml"

	# 	# data = YAML::dump(self)

	# 	# data = YAML::dump ({
	# 	# 	:game => game,
	# 	# 	:player => player,
	# 	# 	:computer => computer,
	# 	# 	:board => board,
	# 	# 	:round => self
	# 	# })

	# 	data = YAML::dump ({
	# 		:name => player.name,
	# 		:past_guesses => board.guessed_letters,
	# 		:board => board.body,
	# 		:wrong => board.wrong_count,
	# 		:computer => computer.code,
	# 		:round => round_number
	# 	})

	# 	File.open(filename, "w") do |file|
	# 		file.puts data
	# 	end

	# 	puts "#{filename.split(".")[0].split("/")[1].upcase} SAVED!!!"
	# end

	# def load_game
	# 	# puts #LIST OUT ALL OF THE CURRENT FILES IN FILE_SAVE, EACH FILE PRECEEDED BY A NUMBER FOR SELECTION
	# 	save_file = Dir.open("./file_save/")
		
	# 	Dir.foreach(save_file) {|file| file.length > 5 ? print("#{file.split(".")[0]}\n") : "" }

	# 	puts "\nWhich file would you like to load?"
	# 	previous_save = gets.chomp

	# 	puts "FILE:" +  "./file_save/#{previous_save}.yaml"

	# 	data = YAML.load("./file_save/#{previous_save}.yaml")

	# 	puts "DATA: #{data}"

	# 	self.new(data[:name], data[:past_guesses], data[:board], data[:wrong], data[:computer], data[:round] )
	# 	# self.new

	# 	# File.open("./file_save/#{previous_save}.yaml") { |yf| YAML::load(yf) }

	# 	# File.open("./file_save/#{previous_save}.yaml", "w") do |file|
	# 		# YAML::load(file)
	# 	# end
	# end
end