# encoding: utf-8

=begin

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


# fulfill exercise specs by printing amounts
egg_packer = Boxmachine.new( 1000, 6 )
puts egg_packer.storage
puts egg_packer.box_size
no_of_boxes = egg_packer.fill
puts no_of_boxes
puts egg_packer.storage