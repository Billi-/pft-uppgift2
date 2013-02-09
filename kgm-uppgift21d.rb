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

