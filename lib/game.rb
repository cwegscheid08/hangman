class Game
	attr_accessor :board, :player, :computer, :round

	require "./lib/board.rb"
	require "./lib/player.rb"
	require "./lib/computer.rb"
	require "./lib/round.rb"
	require "yaml"

	def initialize(name = "", past_guesses = "", board = "", wrong = "", computer = "", round = "")
		puts "What's your name?"
		name == "" ? @player = Player.new(gets.chomp.downcase.capitalize) : @player = Player.new(name)
		# @player = Player.new(gets.chomp.downcase.capitalize)
		wrong == "" ? @computer = Computer.new : @computer = Computer.new(computer)
		# @computer = Computer.new
		board == "" ? @board = Board.new(@player, @computer) : @board = Board.new(@player, @computer, board, wrong)
		# @board = Board.new(@player, @computer)
		@round = Round.new(@player, @computer, @board, self, round)
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

		# puts "DATA: #{self.to_yaml}"

		# data = YAML::dump(self)

		# puts "DATA: #{data}"

		# data = YAML::dump ({
		# 	:game => game,
		# 	:player => player,
		# 	:computer => computer,
		# 	:board => board,
		# 	:round => self
		# })

		data = YAML::dump ({
			:player_name => player.name,
			:past_guesses => board.past_letters,
			:board => board.body,
			:wrong => board.wrong_count,
			:board_secret => board.secret,
			:computer => computer.code,
			:round => round.round_number
		})

		File.open(filename, "w") do |file|
			file.puts data
		end

		puts "#{filename.split(".")[0].split("/")[1].upcase} SAVED!!!"

		exit
	end

	def load_game
		# puts #LIST OUT ALL OF THE CURRENT FILES IN FILE_SAVE, EACH FILE PRECEEDED BY A NUMBER FOR SELECTION
		puts "THIS ROUND: #{computer.code}"

		save_file = Dir.open("./file_save/")
		
		Dir.foreach(save_file) {|file| file.length > 5 ? print("#{file.split(".")[0]}\n") : "" }

		puts "\nWhich file would you like to load?"
		previous_save = gets.chomp

		# puts "FILE_EXISTS?:#{File.exist?("./file_save/#{previous_save}.yaml")}"
		# puts "RUN: #{YAML::load(File.read("./file_save/#{previous_save}.yaml"))}"

		data = YAML::load(File.read("./file_save/#{previous_save}.yaml"))
		# data = YAML::load("./file_save/#{previous_save}.txt")

		print "DATA:#{data}\nNAME:#{data[:player_name]}\nPAST:#{data[:past_guesses]}\nBOARD:#{data[:board]}\nWRONG:#{data[:wrong]}\nCOMPUTER:#{data[:computer]}\nROUND:#{data[:round]}\n"

		player.name = data[:player_name],
		board.guessed = data[:past_guesses],
		board.body = data[:board],
		board.wrong_count = data[:wrong],
		computer.code = data[:computer],
		board.secret = data[:board_secret],
		round.round_number = data[:round]

		# print "DATA_X:#{data}\nNAME:#{player.name}\nPAST:#{board.guessed}\nBOARD:#{board.body}\nWRONG:#{data[board.wrong_count]}\nCOMPUTER:#{computer.code}\nBOARD_SECRET:#{board.secret}\nROUND:#{round.round_number}\n"

		start_game
		# puts "DATA: #{data} DATA_1: #{File.open(data, "r")}"

		

		# self.new()
		# self.new(data[:name], data[:past_guesses], data[:board], data[:wrong], data[:computer], data[:round] )
		# self.new

		# File.open("./file_save/#{previous_save}.yaml") { |yf| YAML::load(yf) }

		# File.open("./file_save/#{previous_save}.yaml", "w") do |file|
			# YAML::load(file)
		# end
	end
end

new_game = Game.new
# new_game.computer.any_letters?(new_game.player.guess)
# new_game.computer.display
# new_game.player.display