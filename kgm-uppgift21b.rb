# encoding: utf-8

# testsviten har givit oss fill_boxes
def fill_boxes( total_amount, box_size )
	return total_amount/box_size
end

# men för att uppfylla specen i uppgiften måste vi skriva ut resultatet
puts fill_boxes( 1000, 6 )
