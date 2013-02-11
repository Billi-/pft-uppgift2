# encoding: utf-8

# uppgift22

# läs in lista av ord från fil
words = File.open('words.txt').readlines
words.map! { |w| w.chomp }
#puts words.inspect #debug

# slumpa fram det rätta ordet från listan
target = words[ rand(0...words.length) ]
puts "ordet är " + target.inspect #debug

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

# skapa tom lista på tidigare gissningar
guessed_letters = []

# kör spel-loopen:
loop do
 # skriv ut hängda kroppsdelar
 puts "På galgen: "
 print_hanged_parts

 # skriv ut gissade bokstäver
 puts "Dina gissningar hittils: " 
 guessed_letters.each do |letter|
 	print letter + " "
 end
 # skriv ut ordet med icke gissade bokstäver som #
 # läs in gissning

 # om gissningen var fel, tala om det för spelaren
 # om spelaren är hängd, gå ur spel-loopen
 # om spelaren har gissat ordet, gå ur spel-loopen

	break #debug	
end

# skriv ut det rätta ordet, samt antal gissningar
