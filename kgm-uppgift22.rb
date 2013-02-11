# encoding: utf-8

# uppgift22

# läs in lista av ord från fil
words = File.open('words.txt').readlines
words.map! { |w| w.chomp }
#puts words.inspect #debug

# slumpa fram det rätta ordet från listan
target = words[ rand(0...words.length) ]
puts "ordet är " + target.inspect #debug

$target_letters = target.split(//) # split empty regexp => split to individual letters
puts $target_letters.inspect #debug

# skapa global hash med kroppsdelar, inkl. om de har hängts ännu
$hanged_parts = {}
# %w är syntaktiskt socker för att skapa en lista av ord, den motsvarar ["head", "chest", ... ]
%w/head chest left_arm right_arm left_leg right_leg left_hand right_hand left_foot right_foot/.each do |part|
	$hanged_parts[part] = false
end
#puts $hanged_parts.inspect #debug

# skriv ut de kroppsdelar som är hängda

def print_hanged_parts
	$hanged_parts.each do |part, is_hanged|
		print part + " " if is_hanged 
	end
end

def all_parts_hanged?
	all_hanged = true
	$hanged_parts.each do |part, is_hanged|
		all_hanged = false unless is_hanged
	end
	all_hanged
end

def has_guessed_word?
	won_flag = true
	$target_letters.each do |letter|
		won_flag = false unless $guessed_letters.member?( letter )
	end
	won_flag
end
puts



# skapa tom lista på tidigare gissningar
$guessed_letters = [] # = ["a"] #debug

# kör spel-loopen:
loop do
 # skriv ut hängda kroppsdelar
 puts "På galgen: "
 print_hanged_parts

 # om spelaren är hängd, gå ur spel-loopen
 if all_parts_hanged? then # all parts are hanged..
 	puts "Spelet är över!"
 	exit
 end
 puts

 # skriv ut gissade bokstäver
 puts "Dina gissningar hittils: " 
 $guessed_letters.each do |letter|
 	print letter + " "
 end
puts

puts "Det sökta ordet: "
 # skriv ut ordet med icke gissade bokstäver som #

# separate into two different methods

won_flag = true
$target_letters.each do |letter|
	if $guessed_letters.member?( letter ) then
		print letter
	else
		print "#"
		won_flag = false
	end
end
puts

 # om spelaren har gissat ordet, gå ur spel-loopen
 if has_guessed_word? then
 	puts "Grattis, du har vunnit!"
 	exit
 end

 # läs in gissning
 print "Din gissning (en bokstav)> "
 guess = gets.chomp
 # TODO input error handling

 $guessed_letters << guess

 # om gissningen var fel, tala om det för spelaren
 unless $target_letters.member?( guess ) then
 	puts "Du gissade fel!"

	$hanged_parts.each do |part, is_hanged|
		unless is_hanged then
			$hanged_parts[part] = true
			break 
		end
	end 	
 end



#	break #debug	
end

# skriv ut det rätta ordet, samt antal gissningar
