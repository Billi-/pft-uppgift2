# encoding: utf-8

=begin

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

	def to_s
		"The machine has #{@storage} units in storage and is set to a box size of #{@box_size}."
	end
end

egg_packer = Boxmachine21d.new( 1000, 6 )
puts egg_packer.storage
no_of_boxes = egg_packer.fill
puts no_of_boxes # should be 166
puts egg_packer.storage # should be 4
egg_packer.load(1000)
puts egg_packer.fill # should be 167
puts egg_packer.storage # should be 2
egg_packer.load(50)
puts egg_packer.fill(10).inspect # should be ”nil”
puts egg_packer.fill(5) # should be 5
puts egg_packer.storage # should be 22
puts egg_packer # uses class to_s method
