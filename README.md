# hangman

##OVERVIEW

This program is a single-player, command line game. The player must try and determine the computers secret word through a series of guesses, each incorrect guess resulting in another part of the hungman being drawn. If you can guess the complete word in fewer guesses than incorrect guesses, that result in the hungman being completely drawn, you win. The secret word will be determinded by a randomizer that selectes word from a downloaded dictionary. Each secret word must be between 5 to 12 letters long. The program will be broken up into the classes; GAME, BOARD, PLAYER, COMPUTER, and ROUND. Game willb ethe main file to initialize the rest. Once it is called it will build a board, set the computer, ask the player for hteir information, ask to restore a previous game, and lastely initialize the round. 

###GAME

	Should start by building each one of the following classes, but before building the round class, it should ask if the player would like to restore a previously played game.  The mechanics of that working will have to be worked out later. It should be able to determine if the player has won, lost, or if the game is still being played each round.
	

###BOARD
	
	This is where the display will be generated.  It will need to display "_" in place of letters in the secret word, to show how long the secret word is,  previously guessed letters, how many rounds are left, and the hungman. 

###PLAYER

	Player information will be the just the players name. Each round, the player should be asked "Give me a letter." and then prompted to input a letter of the alphabet.  This guess should be case insensitive and shouldn't accept anything that isn't a letter.  

###COMPUTER

	Must select a secret, 5-12 letter, word from the dictionary and store as secret word.  It must also take in the player's guessed letter and compare with its secret word to see if the letter is contained in its spelling. If this is true, then the display should update to reveal the location of these correctly guessed letter instead of the corresponding "_".  If it is false, then the letter should be displayed under the already used letter area and another limb should be added to the hungman. Also, if the player puts in a letter that has already been guessed, a message should be returned that says "Already guessed that one." and it should ask for a letter again.

	The randomized word will have to be selected from dictionary.csv in the root file, and must not be more or less that 5-12 words.  

###ROUND

	First should ask for a players guess, than call for a comparison of the guess against the code word, update the board, ask if the game is over, and display the board.