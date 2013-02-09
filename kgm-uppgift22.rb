# encoding: utf-8

# uppgift22

# läs in lista av ord från fil
words = File.open('words.txt').readlines
words.map! { |w| w.chomp }
puts words.inspect #debug

# slumpa fram det rätta ordet från listan
target = words[ rand(0...words.length) ]
puts target.inspect #debug

# kör spel-loopen:

 # skriv ut hängda kroppsdelar
 # skriv ut gissade bokstäver
 # skriv ut ordet med icke gissade bokstäver som #
 # läs in gissning

 # om gissningen var fel, tala om det för spelaren
 # om spelaren är hängd, gå ur spel-loopen
 # om spelaren har gissat ordet, gå ur spel-loopen

# skriv ut det rätta ordet, samt antal gissningar
