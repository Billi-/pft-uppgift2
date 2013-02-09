# encoding: utf-8

# läs in filer för testsviten från Rubys standardbibliotek
require "test/unit"

# läs in de filer vi vill testa, så att vi kommer åt metoderna
require "./kgm-uppgift21c.rb"

# vår testklass ärver från testsviten

class Uppgift21cTest < Test::Unit::TestCase

	def setup_boxmachine( total_amount = 1000, box_size = 6 )
		return my_machine = Boxmachine.new( total_amount, box_size )
	end

	def test_new_boxmachine

		# create machine using default inital values
		my_machine = setup_boxmachine

		# check we got something back (i.e. my_machine != nil)
		assert( my_machine )
	end

	def test_boxmachine_storage_getter

		total_amount = 1000
		my_machine = setup_boxmachine( total_amount )

		# check that we have total_amount in storage
		assert_equal( total_amount, my_machine.storage )
	end

	def test_boxmachine_box_size_getter

		box_size = 6
		my_machine = setup_boxmachine( box_size )

		# check that we have total_amount in storage
		assert_equal( box_size, my_machine.box_size )
	end

	def test_boxmachine_fill_one_box

		my_machine = setup_boxmachine( 6, 6 )
		assert_equal( 1, my_machine.fill )
	end

	def test_boxmachine_fill_unable_to_fill_any_boxes

		my_machine = setup_boxmachine( 5, 6 )
		assert_equal( 0, my_machine.fill )
	end		

	def test_boxmachine_fill_deducts_from_storage

		my_machine = setup_boxmachine( 10,6 )
		assert_equal( 1, my_machine.fill )
		assert_equal( 4, my_machine.storage )
	end
end
