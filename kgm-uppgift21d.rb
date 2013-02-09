# encoding: utf-8

=begin
# Running tests:

...........E..

Finished tests in 0.007271s, 1925.4573 tests/s, 2200.5226 assertions/s.

  1) Error:
test_boxmachine_load_increases_storage(Uppgift21dTest):
NoMethodError: private method `load' called for #<Boxmachine:0x007f92910203c0 @storage=1000, @box_size=6>
    kgm-uppgift21-test.rb:142:in `test_boxmachine_load_increases_storage'

14 tests, 16 assertions, 0 failures, 1 errors, 0 skips
=end

class Boxmachine

	attr_accessor :storage, :box_size

	def initialize( total_amount, box_size )
		# transfer initial values into instance variables
		@storage = total_amount
		@box_size = box_size
	end

	def fill
		no_of_filled_boxes = @storage/@box_size

		@storage -= no_of_filled_boxes*@box_size

		return no_of_filled_boxes
	end

end

