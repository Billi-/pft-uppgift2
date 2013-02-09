# encoding: utf-8

=begin
# Running tests:

.................F

Finished tests in 0.004362s, 4126.5475 tests/s, 5272.8106 assertions/s.

  1) Failure:
test_to_s(Uppgift21dTest) [kgm-uppgift21-test.rb:170]:
<"The machine has 1 units in storage and is set to a box size of 1."> expected but was
<"#<Boxmachine21d:0x007faf5a82ab20>">.

18 tests, 23 assertions, 1 failures, 0 errors, 0 skips

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
				if @storage >= n*box_size then
					@storage -= n*@box_size
					return n #also ignores any extra arguments
				else
					return nil
				end
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

