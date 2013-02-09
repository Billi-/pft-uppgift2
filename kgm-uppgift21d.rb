# encoding: utf-8

=begin
# Running tests:

...............F.

Finished tests in 0.004210s, 4038.0048 tests/s, 4988.1235 assertions/s.

  1) Failure:
test_fill_specified_number_of_boxes_with_insufficient_storage(Uppgift21dTest) [kgm-uppgift21-test.rb:164]:
<nil> expected but was
<2>.

17 tests, 21 assertions, 1 failures, 0 errors, 0 skips
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

