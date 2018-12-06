class Game
	attr_accessor :board, :player, :computer, :round

	require "./lib/board.rb"
	require "./lib/player.rb"
	require "./lib/computer.rb"
	require "./lib/round.rb"
	require "yaml"

	def initialize
		puts "What's your name?"
		@player = Player.new(gets.chomp.downcase.capitalize)
		@computer = Computer.new
		@board = Board.new(@player, @computer)
		@round = Round.new(@player, @computer, @board, self)
		start_game
	end

	def start_game
		until is_over?
			round.single_round
		end
	end

	def is_over?
		if @board.wrong_count >= 6
			lose()
			return true
		elsif (!@board.secret.include?("_")) 
			win()
			return true
		end
		false
	end

	def win
		puts "\n     #{player.name.upcase} WINS!!!\n\n"
	end

	def lose
		puts "\nThe word was #{@computer.code.upcase}\n\n     YOU LOSE!\n\n"
	end

	def save_game
		# Dir.mkdir("file_save") unless Dir.exist? "file_name"

		filename = "file_save/#{player.name.downcase}_#{Time.new.usec}.yaml"

		data = YAML::dump(self)

		File.open(filename, "w") do |file|
			file.puts data
		end
	end

	def load_game
		# puts #LIST OUT ALL OF THE CURRENT FILES IN FILE_SAVE, EACH FILE PRECEEDED BY A NUMBER FOR SELECTION
		save_file = Dir.open("./file_save/")
		
		Dir.foreach(save_file) {|file| file.length > 5 ? print("#{file.split(".")[0]}\n") : "" }

		puts "\nWhich file would you like to load?"
		previous_save = gets.chomp

		replay = YAML.load_file("./file_save/#{previous_save}.yaml")

		replay

		# File.open("./file_save/#{previous_save}.yaml", "w") do |file|
			# YAML::load(file)
		# end
	end
end

new_game = Game.new
# new_game.computer.any_letters?(new_game.player.guess)
# new_game.computer.display
# new_game.player.display