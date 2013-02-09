# encoding: utf-8

=begin
# Running tests:

..............E.

Finished tests in 0.004089s, 3912.9371 tests/s, 4402.0543 assertions/s.

  1) Error:
test_fill_specified_number_of_boxes(Uppgift21dTest):
ArgumentError: wrong number of arguments (1 for 0)
    /Users/kgm/projects/pft/pft-uppgift2/kgm-uppgift21d.rb:17:in `fill'
    kgm-uppgift21-test.rb:158:in `test_fill_specified_number_of_boxes'

16 tests, 18 assertions, 0 failures, 1 errors, 0 skips

=end

class Boxmachine21d

	attr_accessor :box_size
	attr_reader :storage

	def initialize( total_amount, box_size )
		# transfer initial values into instance variables
		@storage = total_amount
		@box_size = box_size
	end

	def fill( *specificed_no_of_boxes )

		# if we got an argument, only fill so many boxes
		specificed_no_of_boxes.each do |n|
			if n then
				@storage -= n*@box_size
				return n #also ignores any extra arguments
			end			
		end

		# else, fill as many boxes as we can.
		no_of_filled_boxes = @storage/@box_size
		@storage -= no_of_filled_boxes*@box_size
		return no_of_filled_boxes
	end

	def load( added_amount )
		@storage += added_amount
	end

end

