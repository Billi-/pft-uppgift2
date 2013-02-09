# encoding: utf-8

=begin
# Running tests:

..F....

Finished tests in 0.002488s, 2813.5048 tests/s, 3215.4341 assertions/s.

  1) Failure:
test_boxmachine_fill_deducts_from_storage(Uppgift21cTest) [kgm-uppgift21-test.rb:78]:
<4> expected but was
<10>.

7 tests, 8 assertions, 1 failures, 0 errors, 0 skips
=end

class Boxmachine

	attr_accessor :storage, :box_size

	def initialize( total_amount, box_size )
		# transfer initial values into instance variables
		@storage = total_amount
		@box_size = box_size
	end

	def fill
		return @storage/@box_size
	end

end