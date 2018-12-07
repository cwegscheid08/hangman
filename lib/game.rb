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

		Dir.mkdir("./file_save/") unless Dir.exists?("./file_save/")

		puts "Would you like to name your file? Y/N" 
		if gets.chomp.downcase[0] == "y"
			puts "Name your file."
			f_name = gets.chomp.downcase.split(" ").join("_").to_s
			filename = "file_save/#{f_name}_#{Time.new.usec}.yaml"
		else
			filename = "file_save/#{player.name.downcase}_#{Time.new.usec}.yaml"
		end

		data = YAML::dump ({
			:player_name => player.name,
			:past_guesses => board.past_letters,
			:board => board.body,
			:wrong => board.wrong_count,
			:board_secret => board.secret,
			:computer => computer.code,
			:round => round.round_number
		})

		File.open(filename, "w") { |file| file.puts data }

		puts "#{filename.split(".")[0].split("/")[1].upcase} SAVED!!!"
		exit
	end

	def load_game



		save_file = Dir.open("./file_save/")
		puts "\nCURRENT SAVES:\n"
		Dir.foreach(save_file) {|file| file.length > 5 ? print("    #{file.split(".")[0]}\n") : "" }
		puts "\nWhich file would you like to load?"
		previous_save = gets.chomp.split(" ").join("_").to_s

		if File.exist?("./file_save/#{previous_save}.yaml")
			data = YAML::load(File.read("./file_save/#{previous_save}.yaml"))

			player.name = data[:player_name]
			board.guessed = data[:past_guesses]
			board.body = data[:board]
			board.wrong_count = data[:wrong]
			computer.code = data[:computer]
			board.secret = data[:board_secret]
			round.round_number = data[:round]

			puts "\n\n\n\n#{board.display}\n#{previous_save.upcase} LOADED!!!\n\n"
			start_game
		else
			puts "\nFILE DOESN'T EXIST\n"
			load_game
		end
	end
end

new_game = Game.new