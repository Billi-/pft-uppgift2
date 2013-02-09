# encoding: utf-8

=begin
	
# Running tests:

.E.

Finished tests in 0.000946s, 3171.2474 tests/s, 2114.1649 assertions/s.

  1) Error:
test_boxmachine_storage_getter(Uppgift21cTest):
NoMethodError: undefined method `storage' for #<Boxmachine:0x007fc17902f638 @storage=1000, @box_size=6>
    kgm-uppgift21-test.rb:54:in `test_boxmachine_storage_getter'

3 tests, 2 assertions, 0 failures, 1 errors, 0 skips

=end

class Boxmachine

	attr_accessor :storage, :box_size

	def initialize( total_amount, box_size )
		# transfer initial values into instance variables
		@storage = total_amount
		@box_size = box_size
	end
end