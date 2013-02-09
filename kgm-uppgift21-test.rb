# encoding: utf-8

# läs in filer för testsviten från Rubys standardbibliotek
require "test/unit"

# läs in de filer vi vill testa, så att vi kommer åt metoderna
require "./kgm-uppgift21b.rb"

# vår testklass ärver från testsviten
class Uppgift21Test < Test::Unit::TestCase

	# metoder med i klassen med namn som börjar med test_ körs automagiskt

	# vi vill testa vår funktion för att fylla lådor, uppgift 21b
	def test_fill_boxes

		# check:a att vi får ut 166 lådor, givet 1000 ägg, 6 ägg/låda
		expected_no_of_boxes = 166
		total_amount = 1000
		box_size = 6

		# assert_equal(expected,actual); är vad vi väntar oss == vad vi faktiskt får?
		assert_equal( expected_no_of_boxes, fill_boxes(total_amount, box_size) )
	end
end
