# encoding: utf-8

# uppgift22

class Hangman 
	@words

	def initialize( words )
		@words = words
		@hanged_parts = {}
		# %w är syntaktiskt socker för att skapa en lista av ord, den motsvarar ["head", "chest", ... ]
		%w/head chest left_arm right_arm left_leg right_leg left_hand right_hand left_foot right_foot/.each do |part|
			@hanged_parts[part] = false
		end
		#puts @hanged_parts.inspect #debug
	end

	def new_game
		# slumpa fram det rätta ordet från listan
		@target = @words[ rand(0...@words.length) ]
		puts "ordet är " + @target.inspect #debug

		@target_letters = @target.split(//) # split empty regexp => split to individual letters
		#puts @target_letters.inspect #debug

		# skapa tom lista på tidigare gissningar
		@guessed_letters = [] # = ["a"] #debug
	end

	# skriv ut de kroppsdelar som är hängda
	def print_hanged_parts
		puts "Hängda delar hittils: "
		@hanged_parts.each do |part, is_hanged|
			print part + " " if is_hanged 
		end
		puts
	end

	def all_parts_hanged?
		all_hanged = true
		@hanged_parts.each do |part, is_hanged|
			all_hanged = false unless is_hanged
		end
		all_hanged
	end

	def print_guessed_letters
		print "Dina gissningar hittils: " 
		@guessed_letters.each do |letter|
			print letter.upcase + " "
		end
		puts
	end

	def has_guessed_word?
		won_flag = true
		@target_letters.each do |letter|
			won_flag = false unless @guessed_letters.member?( letter )
		end
		won_flag
	end

	def print_target_word
		puts "Det sökta ordet: \""
		@target_letters.each do |letter|
			if @guessed_letters.member?( letter ) then
				print letter.upcase
			else
				print "#"
			end
		end
		puts "\""
	end

	def guess_in_target( guess )
		@guessed_letters << guess

		# om gissningen var fel, tala om det för spelaren
		unless @target_letters.member?( guess ) then
			hang_another_part
			return false
		else
			return true
		end
	end

	def hang_another_part
		@hanged_parts.each do |part, is_hanged|
			unless is_hanged then
				@hanged_parts[part] = true
				return
			end
		end
	end
end

# läs in lista av ord från fil
words = File.open('words.txt').readlines
words.map! { |w| w.chomp }
#puts words.inspect #debug

game = Hangman.new( words )
game.new_game

# kör spel-loopen:
loop do
	# skriv ut hängda kroppsdelar
	game.print_hanged_parts

	# skriv ut gissade bokstäver
	game.print_guessed_letters

	# skriv ut ordet med icke gissade bokstäver som #
	game.print_target_word

	# läs in gissning
	print "Din gissning (en bokstav)> "
	guess = gets.chomp # TODO input error handling

	unless game.guess_in_target( guess ) then
		puts "Du gissade fel!"

		# om spelaren är hängd, gå ur spel-loopen
		if game.all_parts_hanged? then # all parts are hanged..
			puts "Spelet är över!"
			exit
		end
	else
		# om spelaren har gissat ordet, gå ur spel-loopen
		if game.has_guessed_word? then
			puts "Grattis, du har vunnit!"
			exit
		end
	end
end

# skriv ut det rätta ordet, samt antal gissningar
