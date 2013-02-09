# encoding: utf-8

=begin
	
# Running tests:

..E..

Finished tests in 0.001326s, 3770.7391 tests/s, 3016.5913 assertions/s.

  1) Error:
test_boxmachine_fill_one_box(Uppgift21cTest):
NoMethodError: undefined method `fill' for #<Boxmachine:0x007f8f7a826bd8 @storage=6, @box_size=6>
    kgm-uppgift21-test.rb:65:in `test_boxmachine_fill_one_box'

5 tests, 4 assertions, 0 failures, 1 errors, 0 skips
=end

class Boxmachine

	attr_accessor :storage, :box_size

	def initialize( total_amount, box_size )
		# transfer initial values into instance variables
		@storage = total_amount
		@box_size = box_size
	end
end